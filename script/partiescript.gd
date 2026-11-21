extends Control

func _ready():
	var data = load("res://Cartes/cartetest.tres")
	for i in 5:
		$vraiterrain/main.ajouter_carte(data)
