extends Key


var multikey

func activate(_key):
	self_modulate = Color(1.0, 1.0, 1.0, 1.0)
func deactivate(_key):
	self_modulate = Color(1.0, 1.0, 1.0, 0.0)

func _gui_input(event):
	if disabled:
		return
	
	if text_edit == null:
		text_edit = EditorGlobals.text_edit
		if text_edit == null:
			push_error("EditorGlobals.text_edit is not set!")
			return
	
	if !(event is InputEventScreenTouch):
		return # other events don't have .pressed, will crash
	if event.pressed:
		_button_process()
	else:
		multikey.visible = false
		self_modulate = Color(1.0, 1.0, 1.0, 1.0)
		EditorGlobals.multikey_exit.emit(name)

func _button_process():
	multikey = get_node("Multikey")
	
	if multikey == null:
		push_error("Multikey does not exist! (key ", name, ")")
	
	multikey.visible = true
	self_modulate = Color(1.0, 1.0, 1.0, 0.0)
	
	EditorGlobals.multikey_active.emit(name)
