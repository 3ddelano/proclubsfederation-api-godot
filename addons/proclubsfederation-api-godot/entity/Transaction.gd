# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name Transaction extends PCFDataclass

var id: String
var buyer: PartialUser
var seller: PartialUser
var item: PartialItem
var transacted_at: String


func _init(p_dict = null).(p_dict, "Transaction"): pass

func from_dict(p_dict: Dictionary):
	.from_dict(p_dict)

	buyer = PartialUser.new(p_dict.buyer)
	seller = PartialUser.new(p_dict.seller)
	item = PartialItem.new(p_dict.item)

	return self
