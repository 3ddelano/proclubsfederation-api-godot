# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name PartialClubMember
extends Reference
var nick: String
var user: PartialUser
var joined_at: String

func from_json(json: Dictionary) -> PartialClubMember:
	if "nick" in json and json["nick"] != null:
		nick = json["nick"]
	user = PartialUser.new().from_json(json["user"])
	joined_at = json["joined_at"]
	return self

func get_class() -> String:
	return "PartialClubMember"

func _to_string() -> String:
	return "PartialClubMember(nick=%s, user=%s, joined_at=%s)" % [nick, user, joined_at]
