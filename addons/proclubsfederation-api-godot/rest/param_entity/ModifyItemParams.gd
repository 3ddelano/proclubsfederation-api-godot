# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name ModifyItemParams
extends Reference
var name = null
var description = null
var cost = null
var stock = null

func to_dict() -> Dictionary:
	var json = {}
	PCFUtils.set_if_not_null(json, "name", name)
	PCFUtils.set_if_not_null(json, "description", description)
	PCFUtils.set_if_not_null(json, "cost", cost)
	PCFUtils.set_if_not_null(json, "stock", stock)
	return json

func get_class() -> String:
	return "ModifyItemParams"

func _to_string() -> String:
	return "ModifyItemParams(name=%s, description=%s, cost=%s, stock=%s)" % [name, description, cost, stock]
