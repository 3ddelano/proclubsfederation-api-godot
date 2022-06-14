# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name PartialApplication
extends Reference
var description: String
var application_type: String
var id: String
var created_at: String

func from_json(json: Dictionary) -> PartialApplication:
	description = json["description"]
	application_type = json["application_type"]
	id = json["id"]
	created_at = json["created_at"]
	return self

func get_class() -> String:
	return "PartialApplication"

func _to_string() -> String:
	return "PartialApplication(id=%s, description=%s, application_type=%s, created_at=%s)" % [id, description, application_type, created_at]
