extends Node

var noteBlueprint = preload("res://scenes/noteBlueprint.tscn")
@onready var player = get_tree().get_first_node_in_group("player")
var spawners_array: Array
#var audio_wav : AudioStreamWAV

# Called when the node enters the scene tree for the first time.
@warning_ignore("unused_parameter")
func _ready() -> void:
	for child in get_children():
		if child is Node3D:
			spawners_array.append(child)
	print(spawners_array)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass

func spawn_note(frequency : float):
	if (player.playerAlive):
		print("Player alive, spawning note")
		var generator = AudioStreamGenerator
		
		# Select random spawner
		var random_spawner = get_random_spawner()
		# Instantiate note
		var note_instance = noteBlueprint.instantiate()
		random_spawner.add_child(note_instance)
		note_instance.get_node("musical note/Area3D").late_ready(frequency)

func get_random_spawner():
	var rng = RandomNumberGenerator.new()
	var random_index = int(rng.randf_range(0, spawners_array.size()-1))
	var new_random_spawner = spawners_array[random_index]
	return new_random_spawner
