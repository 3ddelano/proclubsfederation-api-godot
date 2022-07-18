# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name CreateUserParams extends PCFDataclass

var name: String
var email: String
var password: String
var agent_type = "free"


func _init(p_dict = null).(p_dict, "CreateUserParams"): pass
