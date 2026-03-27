class_name AudioWorker
extends AudioStreamPlayer

var timeout : float
var _timeout_timer : Timer

var tag : String

func _init(new_stream : AudioStream, timeout : float, tag : String = "") -> void:
	stream = new_stream
	self.timeout = timeout
	self.tag = tag
	
	finished.connect(_start_timeout)

func _ready() -> void:
	_timeout_timer = Timer.new()
	_timeout_timer.timeout.connect(queue_free)
	add_child(_timeout_timer)
	play()

func play_new(new_stream : AudioStream, bus : StringName = &"Master") -> void:
	_timeout_timer.stop()
	
	self.bus = bus
	stream = new_stream
	play()

func _start_timeout() -> void:
	_timeout_timer.start(timeout)
