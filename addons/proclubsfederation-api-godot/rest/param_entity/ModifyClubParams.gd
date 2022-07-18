# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name ModifyClubParams extends PCFDataclass

var name = null # [String]
var description = null # [String]
var public = null # [bool]
var money = null # [int]


func _init(p_dict = null).(p_dict, "ModifyClubParams"): pass
