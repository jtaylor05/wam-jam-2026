extends VisualNovelInstance

var bell_sound := preload("res://audio/bell_ding.wav")

@export var vincenzo := preload("res://artwork/icon.svg")

func show_vincenzo() -> void:
	%Interface.set_character_spot(1, vincenzo)

func hide_vincenzo() -> void:
	%Interface.clear_character_spot(1)

func _on_bell_pressed() -> void:
	AudioController.queue_audio_stream(bell_sound, "bell", &"SFX")
	%Interface.start(dialogue, "bell", [{"scene" : self}])


func _on_typewriter_pressed() -> void:
	%Interface.start(dialogue, "typewriter")


func _on_cash_register_pressed() -> void:
	%Interface.start(dialogue, "cash_register")
