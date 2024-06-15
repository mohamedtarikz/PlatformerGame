extends Node2D

const spd = 60
var dir = 1

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var slime = $AnimatedSprite2D

func _process(delta):
	if ray_cast_right.is_colliding():
		dir = -1
		slime.flip_h = 1
	if ray_cast_left.is_colliding():
		dir = 1
		slime.flip_h = 0
	position.x += dir * spd * delta
