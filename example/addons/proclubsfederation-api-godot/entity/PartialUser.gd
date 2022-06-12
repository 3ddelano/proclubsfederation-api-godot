# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name PartialUser
extends Reference
var name: String
var id: String
var money: int
var created_at: String
var agent_type = "free"

func from_json(json: Dictionary) -> PartialUser:
	name = json["name"]
	id = json["id"]
	money = json["money"]
	created_at = json["created_at"]
	if "agent_type" in json and json["agent_type"] != null:
		agent_type = json["agent_type"]
	return self

func get_class() -> String:
	return "PartialUser"

func _to_string() -> String:
	return "PartialUser(name=%s, id=%s, money=%s, created_at=%s, agent_type=%s)" % [name, id, money, created_at, agent_type]
