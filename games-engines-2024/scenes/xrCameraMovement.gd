extends XRCamera3D

@export var speed := 7.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter") # dont need warning for unused params in process funcs
func _process(delta: float) -> void:
	pass

@warning_ignore("unused_parameter")
# Just to remind myself, this function works like _process but called at a fixed rate
# This seems to work the same as FixedUpdate would in Unity
# Camera controls in here
func _physics_process(delta: float) -> void:
	# Local variable for storing direction input
	var direction = Vector3.ZERO
	
	if Input.is_action_pressed("primary"):
		direction.x += 1
	
	if Input.is_action_pressed("secondary"):
		direction.y += 1
	pass
	
