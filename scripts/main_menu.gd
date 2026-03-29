extends Control

func start() -> void:
	get_tree().change_scene_to_file("res://scenes/introduction.tscn")

func quit() -> void:
	get_tree().quit()

func _on_settings_button_pressed() -> void:
	%SettingsMenu.visible = true
