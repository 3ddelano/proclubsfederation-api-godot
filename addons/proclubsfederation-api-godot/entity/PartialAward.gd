# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name PartialAward extends PCFDataclass

var id: String
var name: String
var modifier: int
var created_at: String

var description = null # [String]


func _init(p_dict = null).(p_dict, "PartialAward"): pass
