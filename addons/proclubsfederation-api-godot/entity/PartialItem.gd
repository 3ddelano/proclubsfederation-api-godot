# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name PartialItem extends PCFDataclass

var id: String
var name: String
var created_at: String
var description: String
var cost: int
var seller: PartialUser

var stock: int = 1


func _init(p_dict = null).(p_dict, "PartialItem"): pass

func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	seller = PartialUser.new(p_dict.seller)

	return self
