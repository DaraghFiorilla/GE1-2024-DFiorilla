extends Area3D

# THIS SCRIPT IS NOW PURELY FOR THE BEAT AND SENDING SIGNAL TO
# OTHER AUDIOGENERATION SCRIPT WHICH DOES THE MAIN AUDIO

@export var generator : AudioStreamGenerator
var playback : AudioStreamGeneratorPlayback
@onready var beat_audio_player : XRToolsAreaAudio = get_node("XRToolsAreaAudio")
@onready var stream_player : AudioStreamPlayer3D = get_node("XRToolsAreaAudio")

var bpm = 120.0
var time_per_beat = 60.0/bpm
var beats_per_note = 3
var current_beats = 0
var current_time = 0.0
var pulse_hz = 100.0
@onready var sample_hz: float = generator.mix_rate


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_beat()
	playback = stream_player.get_stream_playback()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# BPM CODE
	current_time += delta
	if current_time >= time_per_beat:
		current_time = 0
		play_beat()
	fill_buffer() # Audio generation happens here
	pass

func play_beat():
	beat_audio_player.play()
	current_beats +=1
	if current_beats >= beats_per_note:
		current_beats = 0 
	
	# PLAY BEAT SOUND
	pass

func fill_buffer():
	var phase = 0.0
	var increment: float = pulse_hz / sample_hz
	var frames_available: int = playback.get_frames_available()
	for i in range(frames_available):
		var frame_data = Vector2.ONE * sin(phase * TAU) # Generate sine wave
		playback.push_frame(frame_data)
		phase = fmod(phase + increment, 1.0)
