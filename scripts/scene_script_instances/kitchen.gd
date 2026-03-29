extends VisualNovelInstance

@export var heron := preload("res://artwork/icon.svg")

func show_heron() -> void:
	%Interface.set_character_spot(0, heron)
	
func hide_heron() -> void:
	%Interface.clear_character_spot(0)

func _on_stovetop_pressed() -> void:
	%Interface.start(dialogue, "stovetop")


func _on_countertop_pressed() -> void:
	%Interface.start(dialogue, "countertop")


func _on_calendar_pressed() -> void:
	%Interface.start(dialogue, "calendar")


func _on_herb_pressed() -> void:
	%Interface.start(dialogue, "bowl_herbs")


func _on_heron_pressed() -> void:
	%Interface.start(dialogue, "heron", [{"scene" : self}])
