# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name ModifyMemberParams
extends Reference
var nick: String

func to_dict() -> Dictionary:
	var json = {
		nick = nick,
	}
	return json

func get_class() -> String:
	return "ModifyMemberParams"

func _to_string() -> String:
	return "ModifyMemberParams(nick=%s)" % [nick]
