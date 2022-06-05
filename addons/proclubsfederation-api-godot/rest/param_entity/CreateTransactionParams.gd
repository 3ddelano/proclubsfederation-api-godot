# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name CreateTransactionParams
extends Reference
var item_id: int
var buyer_id = null

func to_dict() -> Dictionary:
	var json = {
		item_id = item_id
	}
	PCFUtils.set_if_not_null(json, "buyer_id", "buyer_id")
	return json

func get_class() -> String:
	return "CreateTransactionParams"

func _to_string() -> String:
	return "CreateTransactionParams(item_id=%s, buyer_id=%s)" % [item_id, buyer_id]
