extends StaticBody2D

var tex = null

func on_body_enter(body):
	var not_self = body != self
	if not_self:
		body.set("alvo", self)
		if tex != null:
			body.popup(tex)
	return not_self

func on_body_exit(body):
	var not_self = body != self
	if not_self:
		body.set("alvo", null)
		if tex != null:
			body.unpop()
	return not_self
