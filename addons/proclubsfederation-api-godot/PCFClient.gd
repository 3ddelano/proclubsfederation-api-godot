# Copyright 2022 Delano Lourenco, Sairam Mangeshkar
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name PCFClient
extends Node

func set_token(token: Token) -> void:
	_rest_client.set_token(token)
	_ws_client.set_token(token)

func set_debug(_debug: bool):
	_rest_client.debug = _debug
	_ws_client.debug = _debug
	
	_rest_client.update_url()
	_ws_client.update_url()

var _rest_client: PCFRESTClient
var _ws_client: PCFWSClient

func _init() -> void:
	name = "PCFClient"
	pause_mode = PAUSE_MODE_PROCESS

func _ready() -> void:
	_rest_client = PCFRESTClient.new()
	_ws_client = PCFWSClient.new()
	
	add_child(_rest_client)
	add_child(_ws_client)

func get_ws_client() -> PCFWSClient:
	return _ws_client

func get_rest_client() -> PCFRESTClient:
	return _rest_client

func get_class() -> String:
	return "PCFClient"

func _to_string() -> String:
	return "[%s:%d]" % [self.get_class(), self.get_instance_id()]
