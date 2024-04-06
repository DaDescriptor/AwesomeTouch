extends Node


func _pressed():
	var multikey = get_node("Multikey")
	
	if multikey == null:
		push_error("Multikey does not exist! (key ", name, ")")
	
	multikey.visible = true
