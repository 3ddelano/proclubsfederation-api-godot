# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name ClubMember
extends Reference
var nick: String
var user: PartialUser
var joined_at: String
var club: PartialClub

func from_json(json: Dictionary) -> ClubMember:
	nick = PCFUtils.get_or_default(json, "nick", "")
	user = PartialUser.new().from_json(json["user"])
	joined_at = json["joined_at"]
	club = PartialClub.new().from_json(json["club"])
	return self

func get_class() -> String:
	return "ClubMember"

func _to_string() -> String:
	return "ClubMember(nick=%s, user=%s, joined_at=%s, club=%s)" % [nick, user, joined_at, club]
