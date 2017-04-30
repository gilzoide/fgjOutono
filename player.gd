extends KinematicBody2D

export (float) var velocidade
export (float) var posicao_limite
var alvo = null setget set_alvo
var pontos

func _ready():
	reset()
	set_fixed_process(true)
	set_process_input(true)

func reset():
	pontos = {
		"maca": 0,
		"laranja": 0,
		"abacaxi": 0,
		"morango": 0,
		"melancia": 0,
		'coelho': 0,
	}

func aumenta_ponto(categoria):
	pontos[categoria] += 1

func _fixed_process(delta):
	""" Movimento """
	var movimento = Vector2()
	if Input.is_action_pressed("ui_up") and get_pos().y > -posicao_limite:
		movimento.y = -1
	elif Input.is_action_pressed("ui_down") and get_pos().y < posicao_limite:
		movimento.y = 1
	if Input.is_action_pressed("ui_left") and get_pos().x > -posicao_limite:
		movimento.x = -1
	elif Input.is_action_pressed("ui_right") and get_pos().x < posicao_limite:
		movimento.x = 1
	movimento = movimento.normalized() * velocidade
	var motion = move(movimento * delta)
	
	if is_colliding():
		var n = get_collision_normal()
		motion = n.slide(motion)
		move(motion)

func popup(tex):
	get_node("Balao").popup(tex)
	
func unpop():
	get_node("Balao").unpop()

func _input(event):
	""" Ação!
	Pra implementar uma ação, manda um `player.set("alvo", objeto_com_metodo_atua)`
	hora que entrar no lado, e um `player.set("alvo", null)` hora que não precisar mais.
	O objeto deve implementar a função `func atua(player)`
	"""
	if event.is_action_pressed("ui_select") and alvo != null:
		alvo.atua(self)

func set_alvo(novo_alvo):
	if novo_alvo == null:
		unpop()
	alvo = novo_alvo