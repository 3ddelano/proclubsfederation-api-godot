# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name PartialAward
extends Reference
var name: String
var description = null # String
var modifier: int
var id: String
var created_at: String

func from_json(json: Dictionary) -> PartialAward:
	name = json["name"]
	description = PCFUtils.get_or_default(json, "description", null)
	modifier = json["modifier"]
	id = json["id"]
	created_at = json["created_at"]
	return self

func get_class() -> String:
	return "PartialAward"

func _to_string() -> String:
	return "PartialAward(name=%s, description=%s, modifier=%s, id=%s, created_at=%s)" % [name, description, modifier, id, created_at]
