# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name PartialItem
extends Reference
var name: String
var description: String
var cost: int
var stock: int
var id: String
var created_at: String
var seller: PartialUser

func from_json(json: Dictionary) -> PartialItem:
	name = json["name"]
	description = json["description"]
	cost = json["cost"]
	stock = json["stock"]
	id = json["id"]
	created_at = json["created_at"]
	seller = PartialUser.new().from_json(json["seller"])
	return self

func get_class() -> String:
	return "PartialItem"

func _to_string() -> String:
	return "PartialItem(name=%s, description=%s, cost=%s, stock=%s, id=%s, created_at=%s, seller=%s)" % [name, description, cost, stock, id, created_at, seller]
