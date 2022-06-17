# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name Token
extends Reference
var access_token: String
var expires_at = null

func from_json(json: Dictionary) -> Token:
	access_token = json["access_token"]
	expires_at = PCFUtils.get_or_default(json, "expires_at", null)
	return self

func get_class() -> String:
	return "Token"

func _to_string() -> String:
	return "Token(access_token=%s, expires_at=%s)" % [access_token, expires_at]
