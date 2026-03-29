extends CanvasLayer

signal current_updated

signal answer_found

@export var target : String = "9999"

@export var dial_template : SingleDial

var current : String = "0000"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_updated.connect(_check_answer)
	
	for child in %DialContainer.get_children():
		%DialContainer.remove_child(child)
	
	var starting_string : String = ""
	for i in range(target.length()):
		var new_dial : SingleDial = dial_template.duplicate()
		starting_string += str(new_dial.value)
		new_dial.dial_updated.connect(_update_current.bind(i))
		%DialContainer.add_child(new_dial)
	current = starting_string

func _update_current(new_value : int, idx : int) -> void:
	current = current.substr(0, idx) + str(new_value) + current.substr(idx + 1)
	current_updated.emit()

func _check_answer() -> void:
	if current == target:
		answer_found.emit()
