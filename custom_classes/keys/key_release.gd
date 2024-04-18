class_name ReleaseKey extends Key
## Basically a Key but it inserts text when the mouse is released.
## For use in multikeys.


func activate(_key):
	disabled = false

func deactivate(_key):
	disabled = true

func _ready():
	if !is_in_group("multikey"):
		EditorGlobals.multikey_active.connect(deactivate)
		EditorGlobals.multikey_exit.connect(activate)
		# to fix issues when buttons behind the multikey can be pressed
	else:
		is_multikey = true

func _process(_delta):
	if is_hovered():
		activate(null)
	else:
		deactivate(null)

func _input(event):
	print(event)
	if disabled:
		print("disabled")
		return
	
	if text_edit == null:
		text_edit = EditorGlobals.text_edit
		if text_edit == null:
			push_error("EditorGlobals.text_edit is not set!")
			return
	
	if !(event is InputEventScreenTouch):
		print("not screen touch")
		return # other events don't have .pressed, will crash
	
	if event.pressed == false:
		print("processing")
		_button_process()
