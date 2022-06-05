# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name CreateItemParams
extends Reference
var name: String
var description: String
var cost: int
var stock = null
var seller_id = null

func to_dict() -> Dictionary:
	var json = {
		name = name,
		description = description,
		cost = cost
	}
	PCFUtils.set_if_not_null(json, "stock", stock)
	PCFUtils.set_if_not_null(json, "seller_id", seller_id)
	return json

func get_class() -> String:
	return "CreateItemParams"

func _to_string() -> String:
	return "CreateItemParams(name=%s, description=%s, cost=%s, stock=%s, seller_id=%s)" % [name, description, cost, stock, seller_id]
