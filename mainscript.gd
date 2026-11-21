extends HBoxContainer

const CARTE_SCENE = preload("res://scenes/carte.tscn")

func ajouter_carte(data: CardData):
	var carte = CARTE_SCENE.instantiate()
	add_child(carte)
	carte.setup(data)
