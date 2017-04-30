extends CollisionObject2D

var tex = null
var pode_atuar = true

func on_body_enter(body):
	var not_self = body != self
	if pode_atuar and not_self:
		body.set("alvo", self)
		if tex != null:
			body.popup(tex)
	return not_self

func on_body_exit(body):
	var not_self = body != self
	if not_self and body.get("alvo") == self:
		body.set("alvo", null)
	return not_self

func atua(player):
	if pode_atuar:
		if _atua(player):
			on_body_exit(player)
