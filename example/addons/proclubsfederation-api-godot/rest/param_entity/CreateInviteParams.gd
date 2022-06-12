# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name CreateInviteParams
extends Reference
var user_id: int
var club_id: int
var description = null
var inviter_id = null

func to_dict() -> Dictionary:
	var json = {
		user_id = user_id,
		club_id = club_id
	}
	PCFUtils.set_if_not_null(json, "description", description)
	PCFUtils.set_if_not_null(json, "inviter_id", inviter_id)
	return json

func get_class() -> String:
	return "CreateInviteParams"

func _to_string() -> String:
	return "CreateInviteParams(user_id=%s, club_id=%s, description=%s, inviter_id=%s)" % [user_id, club_id, description, inviter_id]
