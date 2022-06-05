# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name CreateAwardParams
extends Reference
var name: String
var modifier: int
var description = null

func to_dict() -> Dictionary:
	var json = {
		name = name,
		modifier = modifier
	}
	PCFUtils.set_if_not_null(json, "description", description)
	return json

func get_class() -> String:
	return "CreateAwardParams"

func _to_string() -> String:
	return "CreateAwardParams(name=%s, modifier=%s, description=%s)" % [name, modifier, description]
