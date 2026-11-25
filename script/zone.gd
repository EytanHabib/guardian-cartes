@tool
extends Control

enum SlotType { SOLDIER, COUNTER, GUARDIAN, GRAVEYARD, DECK }

const TYPE_PAR_ZONE = {
	SlotType.SOLDIER: "soldat",
	SlotType.COUNTER: "contre",
	SlotType.GUARDIAN: "gardien",
}

@export var slot_type: SlotType = SlotType.SOLDIER:
	set(value):
		slot_type = value
		_update_color()

@onready var color_rect: ColorRect = $ColorRect

var carte_posee = null

func _ready():
	if not Engine.is_editor_hint():
		add_to_group("zones")
	_update_color()

func _update_color():
	if color_rect == null:
		return
	match slot_type:
		SlotType.SOLDIER:   color_rect.color = Color("4caf50")
		SlotType.COUNTER:   color_rect.color = Color("e91e8c")
		SlotType.GUARDIAN:  color_rect.color = Color("ff9800")
		SlotType.GRAVEYARD: color_rect.color = Color("212121")
		SlotType.DECK:      color_rect.color = Color("2196f3")

func peut_recevoir(carte) -> bool:
	return carte_posee == null and TYPE_PAR_ZONE.get(slot_type, "") == carte.data.type

func recevoir(carte):
	carte.reparent(self)
	carte.position = Vector2.ZERO
	carte.size = size
	carte.posee = true
	carte_posee = carte
