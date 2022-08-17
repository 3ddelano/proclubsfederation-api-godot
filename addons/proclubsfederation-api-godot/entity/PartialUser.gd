# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name PartialUser extends PCFDataclass

var id: String
var psn_name: String
var name: String
var money: int
var created_at: String
var permissions: int

var agent_type := "free" # One of "free", "signed", "not_interested"

func _init(p_dict = null).(p_dict, "PartialUser"): pass
