# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name CreateApplicationParams
extends Reference
var description: String
var application_type: String
var club_id: String
var applicant_id = null # String

func to_dict() -> Dictionary:
	var json = {
		description = description,
		application_type = application_type,
		club_id = club_id,
	}
	PCFUtils.set_if_not_null(json, "applicant_id", applicant_id)
	return json

func get_class() -> String:
	return "CreateApplicationParams"

func _to_string() -> String:
	return "CreateApplicationParams(description=%s, application_type=%s, applicant_id=%s, club_id=%s)" % [description, application_type, applicant_id, club_id]
