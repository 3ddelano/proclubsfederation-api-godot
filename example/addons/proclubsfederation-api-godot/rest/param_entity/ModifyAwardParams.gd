# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name ModifyAwardParams
extends Reference
var name = null
var description = null
var modifier = null

func to_dict() -> Dictionary:
	var json = {}
	PCFUtils.set_if_not_null(json, "name", name)
	PCFUtils.set_if_not_null(json, "description", description)
	PCFUtils.set_if_not_null(json, "modifier", modifier)
	return json

func get_class() -> String:
	return "ModifyClubParams"

func _to_string() -> String:
	return "ModifyClubParams(name=%s, description=%s, modifier=%s)" % [name, description, modifier]
