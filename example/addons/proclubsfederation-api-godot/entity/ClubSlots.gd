# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name ClubSlots
extends Reference
var slots: int

func from_json(json: Dictionary) -> ClubSlots:
	slots = json["slots"]
	return self

func get_class() -> String:
	return "ClubSlots"

func _to_string() -> String:
	return "ClubSlots(slots=%s)" % [slots]
