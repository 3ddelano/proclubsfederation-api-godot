# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name CreateApplicationParams extends PCFDataclass

var description: String
var application_type: String

var club_id = null # [String]
var applicant_id = null # [String]

func _init(p_dict = null).(p_dict, "CreateApplicationParams"): pass
