extends Node

signal state_added(name : String, value : Variant)
signal state_modified(name : String, value : Variant)

var game_states : Dictionary = {}

func has_state(state_name : String) -> bool:
	return game_states.has(state_name)

func get_state_value(state_name : String) -> Variant:
	if has_state(state_name):
		return game_states[state_name]
	return null

func set_state_value(state_name : String, value : Variant) -> void:
	if not has_state(state_name):
		state_added.emit(state_name, value)
	state_modified.emit(state_name, value)
		
	game_states[state_name] = value
