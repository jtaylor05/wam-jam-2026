extends VisualNovelInstance

func open_lobby() -> void:
	get_tree().change_scene_to_file("res://scenes/lobby.tscn")

func open_suite() -> void:
	get_tree().change_scene_to_file("res://scenes/suite.tscn")

func open_kitchen() -> void:
	get_tree().change_scene_to_file("res://scenes/kitchen.tscn")
	
func open_basement() -> void:
	get_tree().change_scene_to_file("res://scenes/basement.tscn")

func open_greenhouse() -> void:
	get_tree().change_scene_to_file("res://scenes/greenhouse.tscn")
