# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name Award
extends Reference
var name: String
var description = null # String
var modifier: int
var id: String
var created_at: String
var users: Array # Array of PartialUser

func from_json(json: Dictionary) -> Award:
	name = json["name"]
	description = PCFUtils.get_or_default(json, "description", null)
	modifier = json["modifier"]
	id = json["id"]
	created_at = json["created_at"]
	users = []
	for partial_user_data in json["users"]:
		users.append(PartialUser.new().from_json(partial_user_data))
	return self

func get_class() -> String:
	return "Award"

func _to_string() -> String:
	return "Award(name=%s, description=%s, modifier=%s, id=%s, created_at=%s, users=%s)" % [name, description, modifier, id, created_at, users]
