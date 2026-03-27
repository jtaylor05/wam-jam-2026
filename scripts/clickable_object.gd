extends Control

signal pressed

var hovered := false

func _init() -> void:
	mouse_entered.connect(_mouse_enter)
	mouse_exited.connect(_mouse_exit)

func _mouse_enter() -> void:
	hovered = true
	print("hovered")

func _mouse_exit() -> void:
	hovered = false
	print("unhovered")

func _gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("object_picked") and hovered:
		pressed.emit()
