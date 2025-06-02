extends CharacterBody2D

const SPEED = 150
@onready var anim = $AnimatedSprite2D

func _physics_process(delta):
	var input_vector = Vector2.ZERO

	if Input.is_action_pressed("Right"):
		input_vector.x += 1
	if Input.is_action_pressed("Left"):
		input_vector.x -= 1
	if Input.is_action_pressed("Down"):
		input_vector.y += 1
	if Input.is_action_pressed("Up"):
		input_vector.y -= 1

	input_vector = input_vector.normalized()
	velocity = input_vector * SPEED
	move_and_slide()

	# Animation logic
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
