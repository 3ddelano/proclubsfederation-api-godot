# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name CreateTransactionParams extends PCFDataclass

var item_id: int
var buyer_id = null # [String]

func _init(p_dict = null).(p_dict, "CreateTransactionParams"): pass
