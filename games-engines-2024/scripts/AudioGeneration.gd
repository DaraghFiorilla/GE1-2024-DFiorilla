extends Node

var bpm = 120.0
var time_per_beat = 60.0/bpm
var beats_per_note = 3
var current_beats = 0
var current_time = 0.0
var sample_rate = 44100

# These are the Hz frequencies of notes from major scale starting at C4
var major_scale: Array = [261.63, 293.66, 329.63, 349.23, 392.00, 440.00, 493.88, 523.25]

@export var note_spawner : Node
#var spawners_array: Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	current_time += delta
	if current_time >= time_per_beat:
		current_time = 0
		current_beats+=1
		if current_beats >= beats_per_note:
			play_note()
			current_beats = 0

func play_note():
	# GET RANDOM NOTE
	print("play_note")
	var rng = RandomNumberGenerator.new()
	var random_index = int(rng.randf_range(0, major_scale.size()-1))
	var frequency = major_scale[random_index]
	note_spawner.spawn_note(frequency)
