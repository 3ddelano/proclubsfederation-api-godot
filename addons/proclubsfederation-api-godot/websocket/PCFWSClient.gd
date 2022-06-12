
# Copyright 2022 Delano Lourenco, Sairam Mangeshkar
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name PCFWSClient
extends Node

signal client_ready()
signal club_created()

var debug = true
var _wss_url: String
var _logged_in
var session_id

var _client: WebSocketClient
var _token: Token

var heartbeat_timer: Timer
var heartbeat_seq_num: int = -1

func _ready():
	if debug:
		_wss_url = PCFMetadata.GATEWAY_URL_LOCAL
	else:
		_wss_url = PCFMetadata.GATEWAY_URL % PCFMetadata.GATEWAY_VERSION
	_init_wss()

func set_token(token: Token):
	_token = token

func _init_wss():
	_client = WebSocketClient.new()
	_client.connect("connection_established", self, "_connection_established")
	_client.connect("connection_closed", self, "_connection_closed")
	_client.connect("data_received", self, "_data_received")
	
	_client.connect_to_url(_wss_url)
	_create_timers()

func _create_timers():
	heartbeat_timer = Timer.new()
	heartbeat_timer.connect("timeout", self, "_send_heartbeat")
	add_child(heartbeat_timer)

func _data_received():
	var data = _get_json()
	var op = int(data.op)
	match op:
		10: # Hello
			heartbeat_timer.start((data.d.heartbeat_interval/1000)/16)
			print(!heartbeat_timer.is_stopped())
			print("received HELLO OP: 10")
			_send_identify()
		11: # HB ACK
			print("HB ACK")
			heartbeat_seq_num = int(data.s)
		0:
			print("received event")
			_handle_event(data)
		
			
func _connection_established(protocol):
	_client.get_peer(1).set_write_mode(WebSocketPeer.WRITE_MODE_TEXT)
	print("Connection established with protocol: %s" % protocol)

func _connection_closed(was_cleanly_closed):
	print("Connection closed. Cleanly?: %s" % was_cleanly_closed)

func _process(_delta):
	var is_connected = (
		_client.get_connection_status()
		!= NetworkedMultiplayerPeer.CONNECTION_DISCONNECTED
	)
	if is_connected:
		_client.poll()

func _send_heartbeat():
	print("sending heartbeat")
	var seq_num
	if heartbeat_seq_num == -1:
		seq_num = null
	else: 
		seq_num = heartbeat_seq_num
	var payload = {
		'op': 1,
		"s": seq_num
	}
	_send_json(payload)

func _send_identify():
	print("sending identify")
	var payload = {
		'op': 2,
		'd': {
			'token': _token.access_token
		}
	}
	_send_json(payload)

func _send_json(payload: Dictionary):
	var json = to_json(payload)
	print(json)
	_client.get_peer(1).put_packet(json.to_utf8())

func _get_json() -> Dictionary:
	var json = _client.get_peer(1).get_packet().get_string_from_utf8()
	return parse_json(json)

func _handle_event(data: Dictionary):
	var event_name = data.t
	match event_name:
		"READY":
			var user = PartialUser.new().from_json(data.d.user)
			emit_signal("client_ready", user)
			session_id = data.d.session_id
		"CLUB_CREATE":
			var club = PartialClub.new().from_json(data.d)
			emit_signal("club_created", club)
