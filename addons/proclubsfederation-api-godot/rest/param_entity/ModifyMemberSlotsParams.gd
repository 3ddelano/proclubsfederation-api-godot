# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name ModifyMemberSlotsParams
extends Reference
var slots: int

func to_dict() -> Dictionary:
	var json = {
		slots = slots,
	}
	return json

func get_class() -> String:
	return "ModifyMemberSlotsParams"

func _to_string() -> String:
	return "ModifyMemberSlotsParams(slots=%s)" % [slots]
