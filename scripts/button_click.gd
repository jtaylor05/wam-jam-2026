extends Button

@export var push_audio : AudioStream = preload("res://audio/click_in.wav")
@export var released_audio : AudioStream = preload("res://audio/click_out.wav")

func _init() -> void:
	button_down.connect(_button_down)
	button_up.connect(_button_up)

func _button_down() -> void:
	AudioController.queue_audio_stream(push_audio, "button_click", &"SFX")

func _button_up() -> void:
	AudioController.queue_audio_stream(released_audio, "button_click", &"SFX")
