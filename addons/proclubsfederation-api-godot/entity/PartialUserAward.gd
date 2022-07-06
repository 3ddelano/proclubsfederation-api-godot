# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name PartialUserAward
extends Reference
var name: String
var award: PartialAward
var awarded_at: String

func from_json(json: Dictionary) -> PartialUserAward:
	name = json["name"]
	awarded_at = json["awarded_at"]
	award = PartialAward.new().from_json(json["award"])
	return self

func get_class() -> String:
	return "PartialUserAward"

func _to_string() -> String:
	return "PartialUserAward(name=%s, award=%s, awarded_at=%s)" % [name, award, awarded_at]
