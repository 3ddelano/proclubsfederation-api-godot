# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name ClubMember
extends Reference
var user: PartialUser
var joined_at: String
var club: PartialClub
var nick = null # String

func from_json(json: Dictionary) -> ClubMember:
	user = PartialUser.new().from_json(json["user"])
	joined_at = json["joined_at"]
	club = PartialClub.new().from_json(json["club"])
	nick = PCFUtils.get_or_default(json, "nick", null)
	return self

func get_class() -> String:
	return "ClubMember"

func _to_string() -> String:
	return "ClubMember(nick=%s, user=%s, joined_at=%s, club=%s)" % [nick, user, joined_at, club]
