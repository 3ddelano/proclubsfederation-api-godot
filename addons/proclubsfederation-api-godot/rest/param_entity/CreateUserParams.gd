# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name CreateUserParams
extends Reference
var name: String
var email: String
var password: String
var agent_type = "free"

func to_dict() -> Dictionary:
	var json = {
		name = name,
		email = email,
		password = password,
		agent_type = agent_type
	}
	return json

func get_class() -> String:
	return "CreateUserParams"

func _to_string() -> String:
	return "CreateUserParams(name=%s, email=%s, password=%s, agent_type=%s)" % [name, email, "*".repeat(password.length()), agent_type]
