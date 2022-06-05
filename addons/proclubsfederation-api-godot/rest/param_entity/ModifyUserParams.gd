# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name ModifyUserParams
extends Reference
var name = null
var money = null
var agent_type = null

func to_dict() -> Dictionary:
	var json = {}
	PCFUtils.set_if_not_null(json, "name", name)
	PCFUtils.set_if_not_null(json, "money", money)
	PCFUtils.set_if_not_null(json, "agent_type", agent_type)
	return json

func get_class() -> String:
	return "ModifyUserParams"

func _to_string() -> String:
	return "ModifyUserParams(name=%s, money=%s, agent_type=%s)" % [name, money, agent_type]
