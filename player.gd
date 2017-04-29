extends KinematicBody2D

export var velocidade = 200

func _ready():
	set_process(true)

func _process(delta):
	var movimento = Vector2()
	if Input.is_action_pressed("ui_up"):
		movimento.y = -1
	elif Input.is_action_pressed("ui_down"):
		movimento.y = 1
	if Input.is_action_pressed("ui_left"):
		movimento.x = -1
	elif Input.is_action_pressed("ui_right"):
		movimento.x = 1
	movimento = movimento.clamped(1) * velocidade * delta
	move(movimento)
	