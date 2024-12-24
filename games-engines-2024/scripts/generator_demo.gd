extends Node

var sample_hz = 44100/4.0 # Keep the number of samples to mix low, GDScript is not super fast.
var pulse_hz = 440.0
var phase = 0.0

var playback: AudioStreamPlayback = null # Actual playback stream, assigned in _ready().

func _fill_buffer():
	var increment = pulse_hz / sample_hz

	var to_fill = playback.get_frames_available()
	#var buffer : PackedVector2Array
	while to_fill > 0:
		playback.push_frame(Vector2.ONE * 0.5 * sin(phase * TAU)) # Audio frames are stereo.
		phase = fmod(phase + increment, 1.0)
		to_fill -= 1


func _process(_delta):
	if playback != null && !$CheckBox.is_pressed():
		_fill_buffer()

func _ready():
	$Player.stream.mix_rate = sample_hz # Setting mix rate is only possible before play().
	$Player.play()
	playback = $Player.get_stream_playback()
	if playback != null:
		_fill_buffer() # Prefill, do before play() to avoid delay.
