class_name SingleDial
extends VBoxContainer

signal dial_updated(new_value : int)

@export var value : int = 0

func _ready() -> void:
	update_dial()

func update_dial() -> void:
	$PanelContainer/MarginContainer/DialValue.text = str(value)
	dial_updated.emit(value)

func increase_value() -> void:
	value = (value + 1) % 10
	update_dial()

func decrease_value() -> void:
	value = 9 if value == 0 else value - 1
	update_dial()
	
