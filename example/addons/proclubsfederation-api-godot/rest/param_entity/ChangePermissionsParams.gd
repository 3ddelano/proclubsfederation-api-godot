# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name ChangePermissionsParams
extends Reference
var permissions: int

func to_dict() -> Dictionary:
	var json = {
		permissions = permissions
	}
	return json

func get_class() -> String:
	return "ChangePermissionsParams"

func _to_string() -> String:
	return "ChangePermissionsParams(permissions=%s,)" % [permissions]
