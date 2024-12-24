extends Area3D

var health: int
@export var maxHealth: int
var playerAlive: bool
@export var healthBar: ProgressBar
var score : int
@export var scoreText : RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = maxHealth
	playerAlive = true
	healthBar.max_value = maxHealth
	healthBar.min_value = 0
	healthBar.value = health
	scoreText.append_text("Score = 0")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass

func DamagePlayer():
	health -=1
	healthBar.value = health
	print(health)
	if health <= 0:
		print("player died")
		playerAlive = false


func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("note"):
		print("collided with note")
		DamagePlayer()
		area.get_parent().get_parent().queue_free()
	else:
		print("collided with non-note")
	pass # Replace with function body.

func update_score():
	score += 1
	var scoreAsText = str(score)
	scoreText.clear()
	scoreText.append_text("Score = " + scoreAsText)
