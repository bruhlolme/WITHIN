extends Area2D

var is_unlocked = false
var door_opened = false
var ready_for_transition = false

func unlock():
	is_unlocked = true
	$AnimatedSprite2D.play("DoorOpen")
