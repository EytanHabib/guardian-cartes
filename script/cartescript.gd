extends TextureRect

var data: CardData
var posee := false
var en_glissement := false
var parent_origine: Node
var index_origine := 0
var decalage := Vector2.ZERO

func setup(card_data: CardData):
	data = card_data
	texture = data.image

func _gui_input(event):
	if posee:
		return
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		commencer_glissement()

func commencer_glissement():
	en_glissement = true
	parent_origine = get_parent()
	index_origine = get_index()
	decalage = global_position - get_global_mouse_position()
	reparent(get_tree().current_scene)
	size = custom_minimum_size

func _process(_delta):
	if en_glissement:
		global_position = get_global_mouse_position() + decalage

func _input(event):
	if en_glissement and event is InputEventMouseButton \
			and event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
		terminer_glissement()

func terminer_glissement():
	en_glissement = false
	var souris = get_global_mouse_position()
	for zone in get_tree().get_nodes_in_group("zones"):
		if zone.get_global_rect().has_point(souris) and zone.peut_recevoir(self):
			zone.recevoir(self)
			return
	# Aucune zone valide : retour dans la main, à la même place
	reparent(parent_origine)
	parent_origine.move_child(self, index_origine)
