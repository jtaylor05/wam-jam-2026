extends VisualNovelInstance

func to_lobby() -> void:
	print("to_lobby")
	get_tree().change_scene_to_file("res://scenes/lobby.tscn")
