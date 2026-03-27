extends Node

var game_states : Dictionary = {}

func has_state(state_name : String) -> bool:
	return game_states.has(state_name)

func get_state_value(state_name : String) -> Variant:
	if has_state(state_name):
		return game_states[state_name]
	return null

func set_state_value(state_name : String, value : Variant) -> void:
	game_states[state_name] = value
