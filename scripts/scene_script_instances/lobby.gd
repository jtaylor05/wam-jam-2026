extends VisualNovelInstance

var bell_sound := preload("res://audio/bell_ding.mp3")

func _on_bell_pressed() -> void:
	AudioController.queue_audio_stream(bell_sound, "bell", &"SFX")
	%Interface.start(dialogue, "bell")


func _on_typewriter_pressed() -> void:
	%Interface.start(dialogue, "typewriter")


func _on_cash_register_pressed() -> void:
	%Interface.start(dialogue, "cash_register")
