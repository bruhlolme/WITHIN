extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@onready var timer = $Timer  # Add a Timer node in the scene and name it "Timer"
@onready var label = $TimerLabel  
@onready var health_bar = $UI/HealthBar # Optional: A Label node to show countdown

const SPEED = 100
var health = 3
var in_detection_zone = false

func _ready():
	add_to_group("Player")
	timer.wait_time = 20
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))

func _physics_process(_delta):
	var input_vector = Vector2.ZERO
	if Input.is_action_pressed("Right"):
		input_vector.x += 1
	if Input.is_action_pressed("Left"):
		input_vector.x -= 1
	if Input.is_action_pressed("Down"):
		input_vector.y += 1
	if Input.is_action_pressed("Up"):
		input_vector.y -= 1

	velocity = input_vector.normalized() * SPEED
	move_and_slide()

	if input_vector != Vector2.ZERO:
		if input_vector.x > 0:
			anim.play("Right")
		elif input_vector.x < 0:
			anim.play("Left")
		elif input_vector.y > 0:
			anim.play("Down")
		elif input_vector.y < 0:
			anim.play("Up")
	else:
		anim.stop()

	if in_detection_zone and !timer.is_stopped():
		label.text = "Next damage in: " + str(round(timer.time_left)) + "s"

func _on_timer_timeout():
	health -= 1
	health_bar.value = health
	_update_health_animation()
	if health <= 0:
		queue_free()  # or trigger game over
		label.text = "You died"


func _update_health_animation():
	match health:
		3:
			anim.play("Normal")
		2:
			anim.play("Moderate")
		1:
			anim.play("High")
		_:
			anim.play("Dead")
