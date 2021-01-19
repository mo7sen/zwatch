extends Node

var num_players = 8

var available = []
var queue = []

func _ready():
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -50.0)
	for i in num_players:
		var p = AudioStreamPlayer.new()
		add_child(p)
		available.append(p)
		p.connect("finished", self, "_on_stream_finished", [p])

func _on_stream_finished(stream):
	available.append(stream)

func play(sound_path):
	queue.append(sound_path)

func _process(_delta):
	if not queue.empty() and not available.empty():
		available[0].stream = load(queue.pop_front())
		available[0].play()
		available.pop_front()
