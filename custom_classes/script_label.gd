extends Label
## Change text to current opened script's name.

func _ready():
	text = EditorGlobals.current_file
