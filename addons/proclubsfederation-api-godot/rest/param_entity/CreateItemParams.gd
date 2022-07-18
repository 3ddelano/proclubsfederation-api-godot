# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name CreateItemParams extends PCFDataclass

var name: String
var description: String
var cost: int

var stock = null # [int]
var seller_id = null # [String]


func _init(p_dict = null).(p_dict, "CreateItemParams"): pass
