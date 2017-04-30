extends "areaAcao.gd"

export (float) var tempo_crescer = 5
export (float) var tempo_filho = 5
export (float) var total_movimento = 10
const AUMENTO = 1.5
var contador
var adulto = false

func _ready():
	tex = load("res://coelho-placeholder.png")
	contador = 0.0
	set_process(true)


func _process(delta):
	if adulto:
		if contador > tempo_filho:
			var novo = duplicate()
			novo.set_scale(Vector2(1, 1))
			get_tree().get_root().add_child(novo)
			contador = 0
	else:
		if contador > tempo_crescer:
			adulto = true
			scale(Vector2(AUMENTO, AUMENTO))
			contador = 0
	contador += delta
	if randf() < 0.01:
		move_local_x((randf() * 2 - 1) * total_movimento)
		move_local_y((randf() * 2 - 1) * total_movimento)


func _atua(player):
	player.aumenta_ponto("coelho")
	# morreu =/
	self.queue_free()
