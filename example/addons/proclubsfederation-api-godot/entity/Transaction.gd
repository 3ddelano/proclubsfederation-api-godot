# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name Transaction
extends Reference
var id: String
var buyer: PartialUser
var seller: PartialUser
var item: PartialItem
var transacted_at: String

func from_json(json: Dictionary) -> Transaction:
	id = json["id"]
	buyer = PartialUser.new().from_json(json["buyer"])
	seller = PartialUser.new().from_json(json["seller"])
	item = PartialItem.new().from_json(json["item"])
	transacted_at = json["transacted_at"]
	return self

func get_class() -> String:
	return "Transaction"

func _to_string() -> String:
	return "Transaction(id=%s, buyer=%s, seller=%s, item=%s, transacted_at=%s)" % [id, buyer, seller, item, transacted_at]
