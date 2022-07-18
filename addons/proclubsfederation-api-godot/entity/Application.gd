# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name Application extends PCFDataclass

var id: String
var created_at: String
var applicant: PartialUser # [PartialUser]
var description: String
var application_type: String # One of "club_application" or "manager_application"

var club = null # [PartialClub]
var accepted := false


func _init(p_dict = null).(p_dict, "Application"): pass

func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	applicant = PartialUser.new(p_dict.applicant)
	if "club" in p_dict:
		club = PartialClub.new(p_dict.club)

	return self
