extends Button


@export var hide_in_peek: Array[Node] # nodes that are hidden in peek mode
@export var show_in_peek: Array[Node] # nodes that are shown in peek mode

@export var icon_off: Texture2D # when peak mode is disabled
@export var icon_on: Texture2D # when peak mode is enabled

var peak_enabled: bool = false

func _pressed():
	peak_enabled = !peak_enabled # inverse
	
	for node in hide_in_peek:
		node.visible = !peak_enabled
	for node in show_in_peek:
		node.visible = peak_enabled
	
	icon = icon_off if peak_enabled else icon_off
