extends Node

var pieces_collected = 0
const TOTAL_PIECES = 5

func _ready():
	pieces_collected = 0

func _on_collectible_1_collected() -> void:
	pieces_collected += 1
	if pieces_collected == TOTAL_PIECES:
		unlock_door()

func _on_collectible_2_collected() -> void:
	pieces_collected += 1
	if pieces_collected == TOTAL_PIECES:
		unlock_door()

func _on_collectible_3_collected() -> void:
	pieces_collected += 1
	if pieces_collected == TOTAL_PIECES:
		unlock_door()

func _on_collectible_4_collected() -> void:
	pieces_collected += 1
	if pieces_collected == TOTAL_PIECES:
		unlock_door()

func _on_collectible_5_collected() -> void:
	pieces_collected += 1
	if pieces_collected == TOTAL_PIECES:
		unlock_door()
		
func unlock_door():
	var door = get_node("Door")
	door.unlock()
