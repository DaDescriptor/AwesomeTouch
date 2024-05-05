extends Node


var crash_prefab = preload("res://scenes/fatal_error.tscn")

func error(text: String):
	print("Fatal error! Exiting!")
	print(text)
	
	for node in get_tree().root.get_children():
		if node != self:
			node.queue_free()
	
	var crash_screen = crash_prefab.instantiate()
	get_tree().root.add_child(crash_screen)
	
	var body = crash_screen.get_node("VBoxContainer/Body")
	body.text = body.text % text
	
	self.queue_free()
