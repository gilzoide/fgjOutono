extends Sprite

const tamanho_esperado = Vector2(100, 100)

func popup(tex):
	var sprite = get_node("Sprite")
	sprite.set_texture(tex)
	sprite.set_scale(tamanho_esperado / tex.get_size())
	show()

func unpop():
	get_node("Sprite").set_texture(null)
	hide()
