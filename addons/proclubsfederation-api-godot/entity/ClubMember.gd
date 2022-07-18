# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name ClubMember extends PCFDataclass

var user: PartialUser # [PartialUser]
var joined_at: String
var club: PartialClub # [PartialClub]

var nick = null # String


func _init(p_dict = null).(p_dict, "ClubMember"): pass

func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	user = PartialUser.new(p_dict.user)
	club = PartialClub.new(p_dict.club)

	return self
