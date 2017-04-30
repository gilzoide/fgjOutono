extends Node

var precisa_de
var painel_template = preload("res://PainelPrecisa.tscn")
var painel
export (float) var tempo_precisa = 5
var contador

const estacoes = ['outono', 'inverno', 'primavera', 'verao']
const cores_por_estacao = {
	'outono': Color("#fdd43d"),
	'inverno': Color("#ffffff"),
}

func _ready():
	troca_estacao(0)

func mostra_precisa():
	painel = painel_template.instance()
	painel.set_pos(get_node("Player").get_pos())
	add_child(painel)
	painel.poppa(precisa_de, tempo_precisa)

func troca_estacao(estacao=null):
	estacao = estacao if estacao != null else (estacao + 1) % estacoes.size()
	var a_estacao = estacoes[estacao]
	VisualServer.set_default_clear_color(cores_por_estacao[a_estacao])
	if a_estacao == 'outono':
		get_node("Fundo").show()
	else:
		get_node("Fundo").hide()