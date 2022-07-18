# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name Award extends PCFDataclass

var id: String
var name: String
var modifier: int
var created_at: String

var description = null # [String]
var users: Array # [Array] of [PartialUser]


func _init(p_dict = null).(p_dict, "Award"): pass

func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	if "users" in p_dict:
		users = []
		for data in p_dict.users:
			users.append(PartialUser.new(data))

	return self
