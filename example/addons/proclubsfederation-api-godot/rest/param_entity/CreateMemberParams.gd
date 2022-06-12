# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name CreateMemberParams
extends Reference
var user_id: int
var nick = null

func to_dict() -> Dictionary:
	var json = {
		user_id = user_id,
	}
	PCFUtils.set_if_not_null(json, "nick", nick)
	return json

func get_class() -> String:
	return "CreateMemberParams"

func _to_string() -> String:
	return "CreateMemberParams(user_id=%s, nick=%s)" % [user_id, nick]
