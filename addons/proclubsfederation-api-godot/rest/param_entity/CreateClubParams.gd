# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name CreateClubParams extends PCFDataclass

var name: String
var description: String

var public := false
var owner_id = null # [String]


func _init(p_dict = null).(p_dict, "CreateClubParams"): pass
