# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name PartialClub
extends Reference
var description: String
var name: String
var id: String
var created_at: String
var money: int
var member_limit: int
var public = null # bool

func from_json(json: Dictionary) -> PartialClub:
	description = json["description"]
	name = json["name"]
	public = PCFUtils.get_or_default(json, "public", null)
	id = json["id"]
	created_at = json["created_at"]
	money = json["money"]
	member_limit = json["member_limit"]
	return self

func get_class() -> String:
	return "PartialClub"

func _to_string() -> String:
	return "PartialClub(description=%s, name=%s, public=%s, id=%s, created_at=%s, money=%s, member_limit=%s)" % [description, name, public, id, created_at, money, member_limit]
