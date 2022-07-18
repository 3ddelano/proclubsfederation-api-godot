# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name PartialInvite extends PCFDataclass

var id: String
var name: String
var created_at: String
var club: PartialClub
var user: PartialUser

var accepted := false
var description = null # [String]


func _init(p_dict = null).(p_dict, "PartialInvite"): pass

func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	user = PartialUser.new(p_dict.user)
	club = PartialClub.new(p_dict.club)

	return self
