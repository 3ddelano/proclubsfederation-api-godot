# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name CreateAwardParams extends PCFDataclass

var name: String
var modifier: int

var description = null # [String]


func _init(p_dict = null).(p_dict, "CreateAwardParams"): pass
