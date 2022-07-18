# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name PartialClubMember extends PCFDataclass

var user: PartialUser
var joined_at: String

var nick = null # [String]


func _init(p_dict = null).(p_dict, "PartialClubMember"): pass

func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	user = PartialUser.new(p_dict.user)

	return self
