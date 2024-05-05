extends Label


func _process(_dt):
	text = str("Console - ", EditorGlobals.log_name)
