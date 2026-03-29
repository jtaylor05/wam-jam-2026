extends VisualNovelInstance

@export var jeff := preload("res://artwork/icon.svg")

func show_jeff() -> void:
	%Interface.set_character_spot(1, jeff)

func hide_jeff() -> void:
	%Interface.clear_character_spot(1)

func _on_machine_pressed() -> void:
	%Interface.start(dialogue, "machinery")


func _on_barrel_pressed() -> void:
	%Interface.start(dialogue, "wine_barrel")


func _on_jeff_pressed() -> void:
	%Interface.start(dialogue, "jeff", [{"scene" : self}])
