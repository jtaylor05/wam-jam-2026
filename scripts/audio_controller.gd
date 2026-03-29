extends Node

const MAX_WORKERS : int = 16
const WORKER_TIMEOUT : float = 0.4

var _active_workers : Array = []
var _inactive_workers : Array = []
var _worker_pool : Array = []

var _audio_queue : Array = []

func _ready() -> void:
	get_tree().create_timer(0.1).timeout.connect(_play_queue)

func _play_queue() -> void:
	while _audio_queue.size() > 0:
		var successful = _play_on_worker(_audio_queue[0])
		if successful:
			var stream = _audio_queue.pop_front()
			print("stream %s played" % [stream.tag])
		else:
			break
	get_tree().create_timer(0.1).timeout.connect(_play_queue)
		
func _play_on_worker(stream_data : StreamData) -> bool:
	if _inactive_workers.size() > 0:
		var worker : AudioWorker = _inactive_workers.pop_back()
		worker.play_new(stream_data.stream, stream_data.bus)
		worker.tag = stream_data.tag
		_active_workers.append(worker)
		return true
	if _worker_pool.size() < MAX_WORKERS:
		var worker : AudioWorker = AudioWorker.new(stream_data.stream, WORKER_TIMEOUT, stream_data.tag, stream_data.bus)
		add_child(worker)
		_active_workers.append(worker)
		worker.finished.connect(func():
			_active_workers.erase(worker)
			_inactive_workers.append(worker))
		_worker_pool.append(worker)
		worker.tree_exited.connect(func():
			_active_workers.erase(worker)
			_inactive_workers.erase(worker)
			_worker_pool.erase(worker))
		return true
	return false

func queue_audio_file(audio_file : StringName, tag : String = "", bus : StringName = &"Master") -> void:
	var stream : AudioStream = load(audio_file)
	queue_audio_stream(stream, tag, bus)

func queue_audio_stream(audio_stream : AudioStream, tag : String = "", bus : StringName = &"Master") -> void:
	_audio_queue.append(StreamData.new(audio_stream, tag, bus))

func remove_queue_tag(tag : String) -> void:
	var new_queue = []
	for stream_data : StreamData in _audio_queue:
		if not stream_data.has_tag(tag):
			new_queue.append(stream_data)
	_audio_queue = new_queue

func clear_queue() -> void:
	_audio_queue.clear()

class StreamData:
	
	var stream : AudioStream
	var tag : String
	var bus : StringName
	
	func _init(stream : AudioStream, tag : String, bus : StringName) -> void:
		self.stream = stream
		self.tag = tag
		self.bus = bus
	
	func has_tag(tag : String) -> bool:
		return self.tag == tag
