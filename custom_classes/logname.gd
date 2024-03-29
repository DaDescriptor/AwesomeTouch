extends RichTextLabel
## Insert log file name for fatal error screen

func _ready():
	text = text % EditorGlobals.log_name
