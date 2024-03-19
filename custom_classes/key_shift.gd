extends Node

## Icon displayed when shift is not pressed
@export var icon_off: Texture2D
## Icon displayed when shift is pressed
@export var icon_on: Texture2D
## Icon displayed when caps is enabled
@export var icon_caps: Texture2D

# these two are to make sure caps only activates when the button is double-clicked.
var doubleclick_timer: float
## How much time is given for doubleclick to enable caps
@export var doubleclick_timeout: float

func _pressed():
	EditorGlobals.shift_value += 1
	
	if EditorGlobals.shift_value == 1:
		
