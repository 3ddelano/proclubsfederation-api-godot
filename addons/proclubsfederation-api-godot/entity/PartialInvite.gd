# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name PartialInvite
extends Reference
var description: String
var id: String
var created_at: String
var club: PartialClub
var user: PartialUser

func from_json(json: Dictionary) -> PartialInvite:
	description = PCFUtils.get_or_default(json, "description", "")
	id = json["id"]
	created_at = json["created_at"]
	club = PartialClub.new().from_json(json["club"])
	user = PartialUser.new().from_json(json["user"])
	return self

func get_class() -> String:
	return "PartialInvite"

func _to_string() -> String:
	return "PartialInvite(description=%s, id=%s, created_at=%s, club=%s, user=%s)" % [description, id, created_at, club, user]
