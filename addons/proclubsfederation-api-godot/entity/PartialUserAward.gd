# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name PartialUserAward extends PCFDataclass

var name: String
var awarded_at: String
var award: PartialAward


func _init(p_dict = null).(p_dict, "PartialUserAward"): pass

func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if "award" in p_dict:
		award = PartialAward.new(p_dict.award)

	return self
