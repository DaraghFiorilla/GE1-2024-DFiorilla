extends Area3D

var health: int
@export var maxHealth: int
var playerAlive: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = maxHealth
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_3d_area_entered(area: Area3D) -> void:
	if area.is_in_group("note"):
		print("collided with note")
	else:
		print("collided with non-note")
	pass # Replace with function body.

func DamagePlayer():
	health-1
	print(health)
	if health <= 0:
		print("player died")
		playerAlive = false
