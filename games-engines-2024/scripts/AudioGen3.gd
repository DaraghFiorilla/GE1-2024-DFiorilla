extends Area3D

@export var generator : AudioStreamGenerator
var playback : AudioStreamGeneratorPlayback
@onready var beat_audio_player : XRToolsAreaAudio = get_node("XRToolsAreaAudio")
@onready var stream_player : AudioStreamPlayer3D = get_node("XRToolsAreaAudio")

var bpm = 120.0
var time_per_beat = 60.0/bpm
var beats_per_note = 2
var current_beats = 0
var current_time = 0.0
@onready var sample_hz: float = generator.mix_rate
var started = false
var final_frequency : float


func late_ready(frequency:float) -> void:
	final_frequency = frequency
	play_beat()
	playback = stream_player.get_stream_playback()
	generator.buffer_length = 1
	started = true
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# BPM CODE
	if (started):
		current_time += delta
		if current_time >= time_per_beat:
			current_time = 0
			play_beat()
		fill_buffer(final_frequency) # Audio generation happens here

func play_beat():
	beat_audio_player.play()
	current_beats +=1
	if current_beats >= beats_per_note:
		current_beats = 0 
	
	# PLAY BEAT SOUND
	pass

func fill_buffer(pulse_hz : float):
	var phase = 0.0
	var increment: float = pulse_hz / sample_hz
	var frames_available: int = playback.get_frames_available()
	for i in range(frames_available):
		var frame_data = Vector2.ONE * sin(phase * TAU) # Generate sine wave
		playback.push_frame(frame_data)
		phase = fmod(phase + increment, 1.0)
