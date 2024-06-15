extends Area2D

var hp = 3
@onready var timer = $Timer

func _on_body_entered(body):
	hp -= 1
	if hp<=0:
		Engine.time_scale = 0.5
		body.velocity.y = -175.0
		body.get_node("CollisionShape2D").queue_free()
		timer.start()

func _on_timer_timeout():
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
