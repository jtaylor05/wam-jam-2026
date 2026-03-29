extends CanvasLayer

var states_to_files = {
	"initial_letter" : FileInfo.new(preload("res://artwork/icon.svg"), "Letter from Auntie"),
	"shift_calendar" : FileInfo.new(preload("res://artwork/icon.svg"), "Shifts Calendar"),
	"tessa_note" : FileInfo.new(preload("res://artwork/icon.svg"), "Note from Tessa")
}

func _init() -> void:
	visibility_changed.connect(_on_visibility_changed)

func _ready() -> void:
	update_available_resources()

func update_available_resources() -> void:
	for child in %JournalVBoxContainer.get_children():
		%JournalVBoxContainer.remove_child(child)
	
	for state in states_to_files:
		if GameState.get_state_value(state):
			var new_button : Button = Button.new()
			new_button.text = states_to_files[state].label
			new_button.pressed.connect(open_resource.bind(states_to_files[state].resource))
			%JournalVBoxContainer.add_child(new_button)

func open_resource(resource) -> void:
	%ResourcePanel.visible = true
	for child in %ResourceContainer.get_children():
		%ResourceContainer.remove_child(child)
	var texture_rect = TextureRect.new()
	texture_rect.texture = resource
	%ResourceContainer.add_child(texture_rect)

func _on_visibility_changed() -> void:
	update_available_resources()

func _on_resource_close_pressed() -> void:
	%ResourcePanel.visible = false

func _on_journal_close_pressed() -> void:
	visible = false

class FileInfo:
	var resource
	var label
	func _init(res, lab) -> void:
		resource = res
		label = lab
