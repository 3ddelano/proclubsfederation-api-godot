# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name Token extends PCFDataclass

var access_token: String
var expires_at = null


func _init(p_dict = null).(p_dict, "Token"): pass
