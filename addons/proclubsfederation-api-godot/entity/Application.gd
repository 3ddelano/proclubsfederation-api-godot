# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name Application
extends Reference
var description: String
var application_type: String
var id: String
var created_at: String
var applicant: PartialUser
var club = null # PartialClub

func from_json(json: Dictionary) -> Application:
	description = json["description"]
	application_type = json["application_type"]
	id = json["id"]
	created_at = json["created_at"]
	applicant = PartialUser.new().from_json(json["applicant"])
	var _club = PCFUtils.get_or_default(json, "club", null)
	if _club:
		club = PartialClub.new().from_json(_club)
	return self

func get_class() -> String:
	return "Application"

func _to_string() -> String:
	return "Application(id=%s, description=%s, application_type=%s, created_at=%s, applicant=%s, club=%s)" % [id, description, application_type, created_at, applicant, club]
