extends Sprite

func popup(tex):
	get_node("Sprite").set_texture(tex)
	show()

func unpop():
	get_node("Sprite").set_texture(null)
	hide()
