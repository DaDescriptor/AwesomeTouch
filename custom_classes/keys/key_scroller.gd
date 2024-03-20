class_name ScrollKey extends Button
## the cool key which has the hand icon on it
## and serves as the scroll wheel for touchscreen users
## this editor is designed for touchscreen lol

## go one line down when this amount of pixels is scrolled
@export var sensitivity: float = 50.0


## how much did the user move their cursor since holding the button
## probably need to invert this because of godot's coordinate system
var scrolled_amount: Vector2 = Vector2(0, 0) # stupid snake case
## self-explanatory
var is_pressed: bool = false

func _

func _process(_delta):
	scrolled_amount += Input.get_last_mouse_velocity()
	# print(Input.get_last_mouse_velocity())
	# need to check if it works with touchscreen
	# it does
