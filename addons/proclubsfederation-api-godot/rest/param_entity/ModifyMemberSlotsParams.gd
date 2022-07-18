# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name ModifyMemberSlotsParams extends PCFDataclass

var slots: int = -1 # Forces the user to set a valid number


func _init(p_dict = null).(p_dict, "ModifyMemberSlotsParams"): pass
