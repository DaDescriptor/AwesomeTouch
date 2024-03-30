class_name ShiftKey extends Button

## Icon displayed when shift is not pressed
@export var icon_off: Texture2D
## Icon displayed when shift is pressed
@export var icon_on: Texture2D
## Icon displayed when caps is enabled
@export var icon_caps: Texture2D

# these two are to make sure caps only activates when the button is double-clicked.
var doubleclick_timer: float
## How much time is given for doubleclick to enable caps
@export var doubleclick_timeout: float = 0.5


func update_icon(_value = null):
	match EditorGlobals.shift_state:
		0:
			self.icon = icon_off
		1:
			self.icon = icon_on
		2:
			self.icon = icon_caps

func _ready():
	EditorGlobals.shift_state_changed.connect(update_icon)

func _gui_input(event):
	if !(event is InputEventScreenTouch) and !(event is InputEventMouseButton):
		return # other events don't have .pressed
	if !event.pressed:
		return
		# using this instead of _pressed() allows for multitouch
		# with this the editor experience feels way smoother :)
	
	match EditorGlobals.shift_state:
		# basically wrap around 0 and 1 but move to 2 if doubleclicked
		0:
			EditorGlobals.shift_state = 1
			doubleclick_timer = 0.5 # start timer to enable caps
		1:
			if doubleclick_timer > 0:
				# doubleclicked in time
				EditorGlobals.shift_state = 2
			else:
				# loser
				EditorGlobals.shift_state = 0
		2:
			EditorGlobals.shift_state = 0
	
	update_icon()

func _process(delta):
	doubleclick_timer -= delta
