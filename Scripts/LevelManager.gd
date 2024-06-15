extends Node

var score = 0
@onready var label = $"../Player/Score"

func _ready():
	label.text = str(score)

func add_coin():
	score+=1
	label.text = str(score)
