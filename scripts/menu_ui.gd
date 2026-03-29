extends CanvasLayer

var paused : bool = false
var map : bool = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		if not paused:
			pause()
		else:
			close_map()
			resume()
	if event.is_action_pressed("open_map"):
		if paused:
			if map:
				close_map()
				resume()
			else:
				if is_map_visible():
					close_map()
				else:
					open_map()
		else:
			visible = true
			map = true
			pause()
			close_buttons()
			open_map()
		

func pause() -> void:
	paused = true
	visible = true
	get_tree().paused = true

func resume() -> void:
	paused = false
	map = false
	visible = false
	get_tree().paused = false

func to_menu() -> void:
	resume()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func quit() -> void:
	get_tree().quit()

func open_buttons() -> void:
	%ButtonContainer.visible = true

func close_buttons() -> void:
	%ButtonContainer.visible = false

func is_map_visible() -> bool:
	return %MapContainer.visible

func open_map() -> void:
	%MapContainer.visible = true

func close_map() -> void:
	%MapContainer.visible = false
	if map:
		resume()
		open_buttons()
		map = false

func _on_settings_button_pressed() -> void:
	%SettingsMenu.visible = true

func open_journal() -> void:
	%JournalMenu.visible = true
