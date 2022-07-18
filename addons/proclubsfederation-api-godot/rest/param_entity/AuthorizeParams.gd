# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name AuthorizeParams extends PCFDataclass

var email_id: String
var password: String

var grant_type: String = ""
var scopes := []
var client_id: String = ""
var client_secret: String = ""


func _init(p_dict = null).(p_dict, "AuthorizeParams"): pass
