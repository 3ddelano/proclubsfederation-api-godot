# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name User
extends Reference
var name: String
var id: String
var money: int
var created_at: String
var agent_type = "free"
var clubs: Array # Array of PartialClub
var owned_clubs: Array # Array of PartialClub
var invites: Array # Array of PartialInvite
var created_invites: Array # Array of PartialInvite
var awards: Array # Array of Award

func from_json(json: Dictionary) -> User:
	name = json["name"]
	id = json["id"]
	money = json["money"]
	created_at = json["created_at"]
	agent_type = PCFUtils.get_or_default(json, "agent_type", "free")
	clubs = []
	for club_data in json["clubs"]:
		clubs.append(PartialClub.new().from_json(club_data))
	owned_clubs = []
	for owned_club_data in json["owned_clubs"]:
		owned_clubs =.append(PartialClub.new().from_json(owned_club_data))
	invites = []
	for invite_data in json["invites"]:
		invites.append(PartialInvite.new().from_json(invite_data))
	created_invites = []
	for created_invite_data in json["created_invites"]:
		invites.append(PartialInvite.new().from_json(created_invite_data))
	awards = []
	for award_data in json["awards"]:
		clubs.append(Award.new().from_json(award_data))
	return self

func get_class() -> String:
	return "User"

func _to_string() -> String:
	return "User(name=%s, id=%s, money=%s, created_at=%s, agent_type=%s, clubs=%s, owned_clubs=%s, invites=%s, created_invites=%s, awards=%s)" % [name, id, money, created_at, agent_type, clubs, owned_clubs, invites, created_invites, awards]
