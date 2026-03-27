extends VisualNovelInstance

func _init() -> void:
	visibility_changed.connect(_visibility_changed)

func _visibility_changed() -> void:
	%SuiteButton.disabled = false if GameState.get_state_value("suite_open") else true
	%GreenhouseButton.disabled = false if GameState.get_state_value("greenhouse_open") else true
	%BasementButton.disabled = false if GameState.get_state_value("suite_open") else true

func open_lobby() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/lobby.tscn")

func open_suite() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/suite.tscn")

func open_kitchen() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/kitchen.tscn")
	
func open_basement() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/basement.tscn")

func open_greenhouse() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/greenhouse.tscn")
