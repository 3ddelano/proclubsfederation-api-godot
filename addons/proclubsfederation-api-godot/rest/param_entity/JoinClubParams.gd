# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name JoinClubParams
extends Reference
var club_id: int

func to_dict() -> Dictionary:
	var json = {
		club_id = club_id
	}
	return json

func get_class() -> String:
	return "JoinClubParams"

func _to_string() -> String:
	return "JoinClubParams(club_id=%s)" % [club_id]
