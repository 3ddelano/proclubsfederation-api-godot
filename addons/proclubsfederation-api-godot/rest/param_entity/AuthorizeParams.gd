# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name AuthorizeParams
extends Reference
var email_id: String
var password: String
var grant_type: String = ""
var scopes := []
var client_id: String = ""
var client_secret: String = ""

func to_dict() -> Dictionary:
	var json = {
		email_id = email_id,
		password = password,
		grant_type = grant_type,
		scopes = scopes,
		client_id = client_id,
		client_secret = client_secret
	}
	return json

func get_class() -> String:
	return "AuthorizeParams"

func _to_string() -> String:
	return "AuthorizeParams(email_id=%s, password=%s, grant_type=%s, scopes=%s, client_id=%s, client_secret=%s)" % [email_id, "*".repeat(password.length()), grant_type, scopes, client_id, client_secret]
