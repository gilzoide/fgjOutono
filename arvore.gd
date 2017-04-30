extends "areaAcao.gd"

export (float) var tempo_fruta = 10.0
var contador

func _ready():
	tex = load("res://laranja.png")
	pode_atuar = false
	contador = 0.0
	set_process(true)

func _process(delta):
	if contador > tempo_fruta:
		pode_atuar = true
		get_node("Frutas").show()
	else:
		contador += delta

func _atua(player):
	print("arvore")
	get_node("Frutas").hide()
	player.aumenta_ponto("fruta")
	pode_atuar = false
	contador = 0.0
	return true
