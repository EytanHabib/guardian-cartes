# slot.gd
@tool
extends Control

enum SlotType { SOLDIER, COUNTER, GUARDIAN, GRAVEYARD, DECK }

@export var slot_type: SlotType = SlotType.SOLDIER:
	set(value):
		slot_type = value
		_update_color()

@onready var color_rect: ColorRect = $ColorRect

func _ready():
	_update_color()

func _update_color():
	if color_rect == null:
		return
	match slot_type:
		SlotType.SOLDIER:  color_rect.color = Color("4caf50")
		SlotType.COUNTER:  color_rect.color = Color("e91e8c")
		SlotType.GUARDIAN: color_rect.color = Color("ff9800")
		SlotType.GRAVEYARD: color_rect.color = Color("212121")
		SlotType.DECK:     color_rect.color = Color("2196f3")
