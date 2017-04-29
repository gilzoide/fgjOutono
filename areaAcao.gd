extends StaticBody2D

func on_body_enter(body):
	body.set("alvo", self)
	print("entrou")

func on_body_exit(body):
	body.set("alvo", null)
	print("saiu")
