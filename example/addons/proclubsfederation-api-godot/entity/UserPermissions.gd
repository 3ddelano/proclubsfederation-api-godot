# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name UserPermissions
extends Reference
var permissions: int

func from_json(json: Dictionary) -> UserPermissions:
	permissions = json["permissions"]
	return self

func get_class() -> String:
	return "UserPermissions"

func _to_string() -> String:
	return "UserPermissions(permissions=%s)" % [permissions]
