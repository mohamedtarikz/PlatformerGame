extends CharacterBody2D

const spd = 60
var dir = 1
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_down = $RayCastDown
@onready var slime = $AnimatedSprite2D

func _physics_process(delta):
	if not ray_cast_down.is_colliding():
		velocity.y += gravity * delta
	move_and_slide()

func _process(delta):
	if ray_cast_right.is_colliding():
		dir = -1
		slime.flip_h = 1
	if ray_cast_left.is_colliding():
		dir = 1
		slime.flip_h = 0
	position.x += dir * spd * delta
