extends Control

@export var list_from: Node

func _ready():
	print(list_from.get_child(0))
	# fuck languages that start indexes from zero
