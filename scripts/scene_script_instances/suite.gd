extends VisualNovelInstance

@export var rita : Texture2D = preload("res://artwork/icon.svg")

func show_rita() -> void:
	%Interface.set_character_spot(2, rita)

func hide_rita() -> void:
	%Interface.clear_character_spot(2)

func _on_wardrobe_pressed() -> void:
	%Interface.start(dialogue, "wardrobe")


func _on_bed_pressed() -> void:
	%Interface.start(dialogue, "bed")


func _on_painting_pressed() -> void:
	%Interface.start(dialogue, "painting")


func _on_rita_pressed() -> void:
	%Interface.start(dialogue, "rita", [{"scene" : self}])


func _on_clock_pressed() -> void:
	%Interface.start(dialogue, "clock")


func _on_suitcase_pressed() -> void:
	%KeycodeEntry.visible = true


func _on_keycode_closed_pressed() -> void:
	%KeycodeEntry.visible = false


func _on_keycode_answer_found() -> void:
	%SuitcaseButton.disabled = true
	%KeycodeEntry.visible = false
	%Interface.start(dialogue, "journal")
