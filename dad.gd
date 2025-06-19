extends CharacterBody2D

@onready var detection_zone = $DetectionZone

var speed = 50
var player_chase = false
var player = null

func _physics_process(_delta):
	if player_chase:
		position += (player.position - position)/speed 

func _on_front_body_entered(body: Node2D) -> void:
	player = body
	player_chase = true
	$Enemy_Animation.play("Toward")

func _on_front_body_exited(_body: Node2D) -> void:
	player = null
	player_chase = false
	
func _on_detection_zone_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.in_detection_zone = true
		body.timer.start()

func _on_detection_zone_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.in_detection_zone = false
		body.timer.stop()
		body.label.text = ""
		
func _on_collision_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.health = 0
		body._update_health_animation()
		body.queue_free()
