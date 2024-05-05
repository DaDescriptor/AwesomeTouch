class_name ScrollKey extends Key
## the cool key which has the hand icon on it
## and serves as the scroll wheel for touchscreen users.
## this editor is designed for touchscreen lol.

## go one line down when this amount of pixels is scrolled.
@export var sensitivity: float = 25.0

## how much did the user move their cursor since holding the button.
## probably need to invert this because of godot's coordinate system.
var scrolled_amount: Vector2
## self-explanatory.
var is_pressed: bool = false

func _gui_input(event):
	# i could have modified _button_process to also pass event.pressed
	# but i am too lazy to go over each script again
	if !(event is InputEventScreenTouch):
		return # other events don't have .pressed, will crash
	
	is_pressed = event.pressed
	scrolled_amount = Vector2.ZERO if !is_pressed else scrolled_amount
	# reset if unpressed

func _process(delta):
	if !is_pressed:
		# print("not pressed")
		return
	
	var input = Input.get_last_mouse_velocity()
	
	scrolled_amount += Vector2(
		input.x * delta,
		input.y * delta
	)

	## how much columns got scrolled.
	## example: sensitivity is 50, scrolled_amount is (-125, 23).
	## full_scrolls will be (-2, 0)
	var full_scrolls: Vector2 = Vector2(
		fit_x_into_y(sensitivity, scrolled_amount.x),
		fit_x_into_y(sensitivity, scrolled_amount.y)
	)

	print(str(
		"scrolled: ", scrolled_amount,
		"\nsensitivity: ", sensitivity,
		"\nfull scrolls: ", full_scrolls
	))

	if full_scrolls.x != 0:
		scrolled_amount.x = 0
		EditorGlobals.text_edit.set_caret_column(main_caret_only().x+full_scrolls.x)
	if full_scrolls.y != 0:
		scrolled_amount.y = 0
		EditorGlobals.text_edit.set_caret_line(main_caret_only().y+full_scrolls.y)

func main_caret_only():
	## remove all secondary carets and return main caret's position.
	## returns Vector2(column, line)
	# ideas for name change are welcome
	EditorGlobals.text_edit.remove_secondary_carets()
	return Vector2(
		EditorGlobals.text_edit.get_caret_column(),
		EditorGlobals.text_edit.get_caret_line()
	)

func fit_x_into_y(x, y):
	## tries to fit as many x into y as possible.
	## why gdscript does not have % operator
	return floor(y/x) if y > 0 else ceil(y/x)
