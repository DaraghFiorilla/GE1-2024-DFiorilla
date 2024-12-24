extends Node3D

@export var minSpeed: float
@export var maxSpeed: float
var speed: float
@onready var target = get_tree().get_first_node_in_group("player")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rng = RandomNumberGenerator.new()
	speed = rng.randf_range(minSpeed, maxSpeed)
	if !target:
		print("Can't find target!")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if target:
		# MOVE TOWARDS TARGET OF PLAYER
		var target_position = target.position # PLAYER'S POSITION SHOULDN'T CHANGE BUT WE'LL GRAB IT EVERY FRAME TO BE SAFE
		var my_position = global_position
		var direction = (target_position - my_position).normalized()
		global_position += direction * speed * delta
		# LOOK AT PLAYER ALWAYS
		look_at(target_position, Vector3.UP)
	pass
