class_name VisualNovelInstance
extends Control

@export var dialogue : DialogueResource
@export var start_name : String

func _ready() -> void:
	_start_initial_dialogue()

func _start_initial_dialogue() -> void:
	if dialogue and start_name:
		%Interface.start(dialogue, start_name, [{"scene" = self}])

func toggle_interface() -> void:
	%Interface.visible = not %Interface.visible

func toggle_menu() -> void:
	if %MenuUI.paused:
		%MenuUI.resume()
	else:
		%MenuUI.pause()
