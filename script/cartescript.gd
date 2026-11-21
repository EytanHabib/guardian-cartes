extends TextureRect

var data: CardData

func setup(card_data: CardData):
	data = card_data
	texture = data.image
