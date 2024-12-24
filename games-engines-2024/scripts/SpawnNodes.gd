extends Node

@export var noteLetter: String
@export var noteNumber: int
@onready var player = get_node("Player")

# Called when the node enters the scene tree for the first time.
@warning_ignore("unused_parameter")
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass

func _spawnNode():
	if (player.playerAlive):
		match (noteLetter):
			"A":
				match (noteNumber):
					1:
						print("A1")
					2:
						print("A2")
					3:
						print("A3")
					4:
						print("A4")
					5:
						print("A5")
					6:
						print("A6")
					7:
						print("A7")
			"B":
				match (noteNumber):
					1:
						print("B1")
					2:
						print("B2")
					3:
						print("B3")
					4:
						print("B4")
					5:
						print("B5")
					6:
						print("B6")
					7:
						print("B7")
			"C":
				match (noteNumber):
					1:
						print("C1")
					2:
						print("C2")
					3:
						print("C3")
					4:
						print("C4")
					5:
						print("C5")
					6:
						print("C6")
					7:
						print("C7")
			"D":
				match (noteNumber):
					1:
						print("D1")
					2:
						print("D2")
					3:
						print("D3")
					4:
						print("D4")
					5:
						print("D5")
					6:
						print("D6")
					7:
						print("D7")
			"E":
				match (noteNumber):
					1:
						print("E1")
					2:
						print("E2")
					3:
						print("E3")
					4:
						print("E4")
					5:
						print("E5")
					6:
						print("E6")
					7:
						print("E7")
			"F":
				match (noteNumber):
					1:
						print("F1")
					2:
						print("F2")
					3:
						print("F3")
					4:
						print("F4")
					5:
						print("F5")
					6:
						print("F6")
					7:
						print("F7")
			"G":
				match (noteNumber):
					1:
						print("G1")
					2:
						print("G2")
					3:
						print("G3")
					4:
						print("G4")
					5:
						print("G5")
					6:
						print("G6")
					7:
						print("G7")
	pass
