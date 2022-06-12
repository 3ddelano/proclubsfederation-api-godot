# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name UserAward
extends Reference
var name: String
var award: Award
var awarded_at: String
var user: PartialUser

func from_json(json: Dictionary) -> UserAward:
	name = json["name"]
	award = Award.new().from_json(json["award"])
	awarded_at = json["awarded_at"]
	user = PartialUser.new().from_json(json["user"])
	return self

func get_class() -> String:
	return "UserAward"

func _to_string() -> String:
	return "UserAward(name=%s, award=%s, awarded_at=%s, user=%s)" % [name, award, awarded_at, user]
