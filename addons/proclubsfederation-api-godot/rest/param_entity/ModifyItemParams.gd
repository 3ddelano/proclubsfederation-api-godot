# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name ModifyItemParams extends PCFDataclass

var name = null # [String]
var description = null # [String]
var cost = null # [int]
var stock = null # [int]


func _init(p_dict = null).(p_dict, "ModifyItemParams"): pass
