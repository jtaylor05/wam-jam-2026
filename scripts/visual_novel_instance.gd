class_name VisualNovelInstance
extends Control

@export var dialogue : DialogueResource
@export var start_name : String

func _ready() -> void:
	#DialogueManager.dialogue_started.connect()
	#DialogueManager.dialogue_ended.connect()
	
	if dialogue and start_name:
		%Interface.start(dialogue, start_name, [{"scene" = self}])
	pass
