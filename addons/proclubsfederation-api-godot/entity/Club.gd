# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name Club
extends Reference
var description: String
var name: String
var public: bool
var id: String
var created_at: String
var money: int
var member_limit: int
var members: Array # Array of PartialClubMember
var owner: PartialUser
var invites: Array # Array of PartialInvite

func from_json(json: Dictionary) -> Club:
	description = json["description"]
	name = json["name"]
	public = PCFUtils.get_or_default(json, "public", "")
	id = json["id"]
	created_at = json["created_at"]
	money = json["money"]
	member_limit = json["member_limit"]
	members = []
	for partial_club_member_data in json["members"]:
		members.append(PartialClubMember.new().from_json(partial_club_member_data))
	owner = PartialUser.new().from_json(json["owner"])
	invites = []
	for partial_invite_data in json["invites"]:
		invites.append(PartialInvite.new().from_json(partial_invite_data))
	return self

func get_class() -> String:
	return "Club"

func _to_string() -> String:
	return "Club(description=%s, name=%s, public=%s, id=%s, created_at=%s, money=%s, member_limit=%s, members=%s, owner=%s, invites=%s)" % [description, name, public, id, created_at, money, member_limit, members, owner, invites]
