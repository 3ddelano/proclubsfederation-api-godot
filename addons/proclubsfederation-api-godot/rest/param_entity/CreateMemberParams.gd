# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name CreateMemberParams extends PCFDataclass

var user_id: String
var nick = null # [String]


func _init(p_dict = null).(p_dict, "CreateMemberParams"): pass
