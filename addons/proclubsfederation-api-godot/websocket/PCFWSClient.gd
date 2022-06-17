
# Copyright 2022 Delano Lourenco, Sairam Mangeshkar
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name PCFWSClient
extends Node

# -- ws --
signal client_ready(user)
signal client_resumed()

# -- clubs --
signal club_create(club)
signal club_update(club)
signal club_delete(club)

# -- clubs members --
signal club_member_create(club_member)
signal club_member_update(club_member)
signal club_member_delete(club_member)

# -- awards --
signal award_create(award)
signal award_update(award)
signal award_delete(award)

# -- items --
signal item_create(item)
signal item_update(item)
signal item_delete(item)

# -- transactions --
signal transaction_create(transaction)

# -- users --
signal user_update(user)

# -- user awards --
signal user_award_create(user_award)
signal user_award_update(user_award)
signal user_award_delete(user_award)

# -- invites --
signal invite_create(invite)
signal invite_update(invite)
signal invite_delete(invite)
signal invite_accept(invite)

# -- applicatins --
signal application_create(application)
signal application_delete(application)

func init():
	_enabled = true
	update_url()

func get_session_id():
	return session_id

func set_token(token: Token):
	_token = token

func update_url():
	if debug:
		_wss_url = PCFMetadata.GATEWAY_URL_LOCAL
	else:
		_wss_url = PCFMetadata.GATEWAY_URL % PCFMetadata.GATEWAY_VERSION

	if _client:
		_disconnect_ws()

	if _enabled:
		_init_wss()


var debug = false
var _enabled = false
var _wss_url: String
var _logged_in
var session_id

var _client: WebSocketClient = null
var _token: Token

var heartbeat_timer: Timer
var heartbeat_seq_num: int = -1


func _init() -> void:
	name = "PCFWSClient"
	pause_mode = PAUSE_MODE_PROCESS

func _disconnect_ws():
	_client.disconnect_from_host()
	_client = null
	heartbeat_timer.stop()
	remove_child(heartbeat_timer)

func _init_wss():
	_client = WebSocketClient.new()
	_client.connect("connection_established", self, "_connection_established")
	_client.connect("connection_closed", self, "_connection_closed")
	_client.connect("data_received", self, "_data_received")
	_client.connect("server_close_request", self, "_server_close_request")

	_client.connect_to_url(_wss_url)
	_create_timers()

func _create_timers():
	heartbeat_timer = Timer.new()
	heartbeat_timer.connect("timeout", self, "_send_heartbeat")
	add_child(heartbeat_timer)

func _data_received():
	var data = _get_json()
	var op = int(data.op)
	print(data)
	match op:
		10: # Hello
			heartbeat_timer.start((data.d.heartbeat_interval/1000)/8)
			_send_identify()
		11: # HB ACK
			heartbeat_seq_num = int(data.s)
		0:
			_handle_event(data)

func _server_close_request(close_code: int, reason: String):
	print("Server requested to close with close_code %d and reason %s" % [close_code, reason])

func _connection_established(protocol):
	_client.get_peer(1).set_write_mode(WebSocketPeer.WRITE_MODE_BINARY)
	print("Connection established.")

func _connection_closed(was_cleanly_closed):
	heartbeat_timer.stop()
	remove_child(heartbeat_timer)
	print("Connection closed. cleanly?: %s" % was_cleanly_closed)

func _process(_delta):
	if _client:
		var is_connected = (
			_client.get_connection_status()
			!= NetworkedMultiplayerPeer.CONNECTION_DISCONNECTED
		)
		if is_connected:
			_client.poll()

func _send_heartbeat():
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
	var payload = {
		'op': 2,
		'd': {
			'token': _token.access_token
		}
	}
	_send_json(payload)

func _send_json(payload: Dictionary):
	var json = to_json(payload)
	_client.get_peer(1).put_packet(json.to_utf8())

func _get_json() -> Dictionary:
	var json = _client.get_peer(1).get_packet().get_string_from_utf8()
	return parse_json(json)

func _handle_event(data: Dictionary):
	var event_name = data.t
	match event_name:
	# -- ws --
		"READY":
			var user = PartialUser.new().from_json(data.d.user)
			emit_signal("client_ready", user)
			session_id = data.d.session_id

		"RESUMED":
			pass # not implemented in api (planned)

	# -- clubs --
		"CLUB_CREATE":
			var club = PartialClub.new().from_json(data.d)
			emit_signal("club_create", club)
		"CLUB_UPDATE":
			var club = PartialClub.new().from_json(data.d)
			emit_signal("club_update", club)
		"CLUB_DELETE":
			var club = PartialClub.new().from_json(data.d)
			emit_signal("club_delete", club)

	# -- club members --
		"CLUB_MEMBER_CREATE":
			var club_member = PartialClubMember.new().from_json(data.d)
			emit_signal("club_member_create", club_member)
		"CLUB_MEMBER_UPDATE":
			var club_member = PartialClubMember.new().from_json(data.d)
			emit_signal("club_member_update", club_member)
		"CLUB_MEMBER_DELETE":
			var club_member = PartialClubMember.new().from_json(data.d)
			emit_signal("club_member_delete", club_member)

	# -- awards --
		"AWARD_CREATE":
			var award = PartialAward.new().from_json(data.d)
			emit_signal("award_create", award)
		"AWARD_UPDATE":
			var award = PartialAward.new().from_json(data.d)
			emit_signal("award_update", award)
		"AWARD_DELETE":
			var award = PartialAward.new().from_json(data.d)
			emit_signal("award_delete", award)

	# -- users --
		"USER_UPDATE":
			var user = PartialUser.new().from_json(data.d)
			emit_signal("user_update", user)

	# -- user awards --
		"USER_AWARD_CREATE":
			var user_award = PartialUserAward.new().from_json(data.d)
			emit_signal("user_award_create", user_award)
		"USER_AWARD_DELETE":
			var user_award = PartialUserAward.new().from_json(data.d)
			emit_signal("user_award_delete", user_award)

	# -- transactions --
		"TRANSACTION_CREATE":
			var transaction = Transaction.new().from_json(data.d)
			emit_signal("transaction_create", transaction)

	# -- items --
		"ITEM_CREATE":
			var item = PartialItem.new().from_json(data.d)
			emit_signal("item_create", item)
		"ITEM_UPDATE":
			var item = PartialItem.new().from_json(data.d)
			emit_signal("item_update", item)
		"ITEM_DELETE":
			var item = PartialItem.new().from_json(data.d)
			emit_signal("item_delete", item)

	# -- applications --
		"APPLICATION_CREATE":
			var application = PartialApplication.new().from_json(data.d)
			emit_signal("application_create", application)
		"APPLICATION_DELETE":
			var application = PartialApplication.new().from_json(data.d)
			emit_signal("application_delete", application)

	# -- invites --
		"INVITE_CREATE":
			var invite = PartialInvite.new().from_json(data.d)
			emit_signal("invite_create", invite)
		"INVITE_UPDATE":
			var invite = PartialInvite.new().from_json(data.d)
			emit_signal("invite_update", invite)
		"INVITE_DELETE":
			var invite = PartialInvite.new().from_json(data.d)
			emit_signal("invite_delete", invite)
		"INVITE_ACCEPT":
			var invite = PartialInvite.new().from_json(data.d)
			emit_signal("invite_accept", invite)

func get_class() -> String:
	return "PCFWSClient"

func _to_string() -> String:
	return "[%s:%d]" % [self.get_class(), self.get_instance_id()]
