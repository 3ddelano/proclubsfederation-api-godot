# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name CreateClubParams
extends Reference
var name: String
var description: String
var public = false
var owner_id = null

func to_dict() -> Dictionary:
	var json = {
		name = name,
		description = description
	}
	PCFUtils.set_if_not_null(json, "public", public)
	PCFUtils.set_if_not_null(json, "owner_id", owner_id)
	return json

func get_class() -> String:
	return "CreateClubParams"

func _to_string() -> String:
	return "CreateClubParams(name=%s, description=%s, public=%s, owner_id=%s)" % [name, description, public, owner_id]
