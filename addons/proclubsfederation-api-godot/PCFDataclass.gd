# Copyright 2022 Delano Lourenco
# MIT LICENSE
# https://github.com/3ddelano/proclubsfederation-api-godot

class_name PCFDataclass
extends Dataclass


func _init(p_dict = null, _name = "PCFDataclass").(_name):
	__options__.print_newline = true
	__options__.include_null_in_dict = false

	if p_dict != null:
		from_dict(p_dict)
	return self


func to_dict() -> Dictionary:
	var dict = .to_dict().duplicate(true)

	for key in dict.keys():
		if typeof(dict[key]) == TYPE_OBJECT and dict[key] != null:
			if dict[key].get_script().get_base_script() == get_script().get_base_script():
				dict[key] = dict[key].to_dict()

	return dict
