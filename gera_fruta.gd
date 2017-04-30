extends "areaAcao.gd"

export (float) var tempo_fruta = 10.0
var contador

func _ready():
	tex = load("res://PandinhaFeliz.png")
	var fruta_tex = load("res://" + self.fruta + ".png")
	for no in get_node("Frutas").get_children():
		no.set_texture(fruta_tex)
	pode_atuar = false
	contador = 0.0
	set_process(true)

func _process(delta):
	if contador > tempo_fruta and pode_atuar == false:
		pode_atuar = true
		get_node("Frutas").show()
	else:
		contador += delta

func _atua(player):
	get_node("Frutas").hide()
	player.aumenta_ponto(self.fruta)
	pode_atuar = false
	contador = 0.0
	return true
