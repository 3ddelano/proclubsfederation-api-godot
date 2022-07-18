# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name PartialClub extends PCFDataclass

var id: String
var name: String
var description: String
var created_at: String
var money: int
var member_limit: int

var public := false


func _init(p_dict = null).(p_dict, "PartialClub"): pass
