# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name User extends PCFDataclass

var id: String
var name: String
var money: int
var created_at: String
var permissions: int

var agent_type = "free" # One of "free", "signed", "not_interested"
var applications: Array # [Array] of [PartialApplication]
var clubs: Array # [Array] of [PartialClub]
var owned_clubs: Array # [Array] of [PartialClub]
var invites: Array # [Array] of [PartialInvite]
var created_invites: Array # [Array] of [PartialInvite]
var awards: Array # [Array] of [PartialUserAward]


func _init(p_dict = null).(p_dict, "User"): pass

func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if "applications" in p_dict:
		applications = []
		for data in p_dict.applications:
			applications.append(PartialApplication.new(data))

	if "clubs" in p_dict:
		clubs = []
		for data in p_dict.clubs:
			clubs.append(PartialClub.new(data))

	if "owned_clubs" in p_dict:
		owned_clubs = []
		for data in p_dict.owned_clubs:
			owned_clubs.append(PartialClub.new(data))

	if "invites" in p_dict:
		invites = []
		for data in p_dict.invites:
			invites.append(PartialInvite.new(data))

	if "created_invites" in p_dict:
		created_invites = []
		for data in p_dict.created_invites:
			created_invites.append(PartialInvite.new(data))

	if "awards" in p_dict:
		awards = []
		for data in p_dict.awards:
			awards.append(PartialUserAward.new(data))

	return self
