extends Node

var noteBlueprint = preload("res://scenes/noteBlueprint.tscn")
@onready var player = get_tree().get_first_node_in_group("player")
var spawners_array: Array

# Called when the node enters the scene tree for the first time.
@warning_ignore("unused_parameter")
func _ready() -> void:
	spawners_array = get_children()
	print(spawners_array)
	spawn_note()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	
	pass

func spawn_note():
	if (player.playerAlive):
		print("Player alive, spawning note")
		# Select random spawner
		var rng = RandomNumberGenerator.new()
		var random_index = int(rng.randf_range(0, spawners_array.size()-1))
		var random_spawner = spawners_array[random_index]
		# Instantiate note
		var note_instance = noteBlueprint.instantiate()
		random_spawner.add_child(note_instance)
		note_instance.global_position = random_spawner.global_position + random_spawner.transform.basis.z.normalized() * 0.3
		
	pass
