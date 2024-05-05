extends MarginContainer
## Enable when multikey mode is active

func enable(_key):
	visible = true
func disable(_key):
	visible = false

func _ready():
	EditorGlobals.multikey_active.connect(enable)
	EditorGlobals.multikey_exit.connect(disable)
