# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name ModifyUserParams extends PCFDataclass

var name = null # [String]
var psn_name = null # [String]
var money = null # [int]
var agent_type = null # [String]


func _init(p_dict = null).(p_dict, "ModifyUserParams"): pass
