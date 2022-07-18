# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name Club extends PCFDataclass

var id: String
var name: String
var description: String
var created_at: String
var money: int
var member_limit: int

var public := false
var members: Array # [Array] of [PartialClubMember]
var invites: Array # [Array] of [PartialInvite]
var applications: Array # [Array] of [PartialApplication]
var owner: PartialUser # [PartialUser]


func _init(p_dict = null).(p_dict, "Club"): pass

func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if "owner" in p_dict:
		owner = PartialUser.new(p_dict.owner)

	if "members" in p_dict:
		members = []
		for data in p_dict.members:
			members.append(PartialClubMember.new(data))

	if "invites" in p_dict:
		invites = []
		for data in p_dict.invites:
			invites.append(PartialInvite.new(data))

	if "applications" in p_dict:
		applications = []
		for data in p_dict.applications:
			applications.append(PartialApplication.new(data))

	return self
