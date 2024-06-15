extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var player = $AnimatedSprite2D
@onready var sound = $sound


func _physics_process(delta):
	var direction = Input.get_axis("left", "right")
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		if Input.is_action_just_pressed("jump"):
			velocity.y = JUMP_VELOCITY
			sound.playing = true
			player.play("jump")
		elif direction:
			player.play("run")
		elif direction == 0:
			player.play("idle")
		

	
	
	if direction:
		velocity.x = direction * SPEED
		if direction > 0:
			player.flip_h = 0
		else:
			player.flip_h = 1
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

