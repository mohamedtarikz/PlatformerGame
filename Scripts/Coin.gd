extends Area2D

@onready var level_manager = %LevelManager
@onready var animation_player = $AnimationPlayer

func _on_body_entered(body):
	level_manager.add_coin()
	animation_player.play("pickup")
