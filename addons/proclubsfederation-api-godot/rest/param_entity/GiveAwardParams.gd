# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name GiveAwardParams
extends Reference
var name: String
var award_id: String

func to_dict() -> Dictionary:
	var json = {
		name = name,
		award_id = award_id
	}
	return json

func get_class() -> String:
	return "GiveAwardParams"

func _to_string() -> String:
	return "GiveAwardParams(name=%s, award_id=%s)" % [name, award_id]
