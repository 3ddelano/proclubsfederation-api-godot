# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name ModifyClubParams
extends Reference
var name = null
var description = null
var public = null
var money = null

func to_dict() -> Dictionary:
	var json = {}
	PCFUtils.set_if_not_null(json, "name", name)
	PCFUtils.set_if_not_null(json, "description", description)
	PCFUtils.set_if_not_null(json, "public", public)
	PCFUtils.set_if_not_null(json, "money", money)
	return json

func get_class() -> String:
	return "ModifyClubParams"

func _to_string() -> String:
	return "ModifyClubParams(name=%s, description=%s, public=%s, money=%s)" % [name, description, public, money]
