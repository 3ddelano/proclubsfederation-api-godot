# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name PartialApplication extends PCFDataclass

var id: String
var application_type: String # One of "club_application" or "manager_application"
var created_at: String
var description: String

var accepted := false

func _init(p_dict = null).(p_dict, "PartialApplication"): pass
