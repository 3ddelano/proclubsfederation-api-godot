# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name CreateInviteParams extends PCFDataclass

var name: String
var user_id: String
var club_id: String

var description = null # [String]
var inviter_id = null # [String]


func _init(p_dict = null).(p_dict, "CreateInviteParams"): pass
