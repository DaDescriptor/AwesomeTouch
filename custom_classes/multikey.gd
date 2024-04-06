extends Panel


func _ready():
	var hide = func(_key):
		visible = false
	
	EditorGlobals.key_pressed.connect(hide)
