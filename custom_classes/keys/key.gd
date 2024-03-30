class_name Key extends Button
## A GUI button which appends a character to a selected TextEdit.
## Automatically makes the text caps when shift is pressed.

## TextEdit that this key will insert text to.
## If not set will use EditorGlobals.text_edit
@export var text_edit: TextEdit
## A letter this key will insert.
## If not set will use the button's text.
@export var letter: String
## What to insert when shift is enabled.
## If not set will turn `letter` into caps.
@export var shifted_letter: String
## Text displayed on the button.
## If not set will use the button's text.
@export var noshift_text: String # really want to make a typo here
## Text displayed on the button when shift is enabled.
## If not set will turn `noshift_text` into caps.
@export var shift_text: String


func _gui_input(event):
	if !(event is InputEventScreenTouch) and !(event is InputEventMouseButton):
		return # other events don't have .pressed, will crash
	if !event.pressed:
		return
		# using this instead of _pressed() allows for multitouch
		# with this the editor experience feels way smoother :)
	
	if text_edit == null:
		text_edit = EditorGlobals.text_edit
		if text_edit == null:
			print("EditorGlobals.text_edit is not set!")
	if letter == null or letter == "":
		print("Letter is not set, trying to autoset..")
		letter = text
		print(str("letter is now set to ", letter))
	if shifted_letter == null or shifted_letter == "":
		print("shifted_letter is not set, trying to autoset..")
		shifted_letter = letter.to_upper()
		print(str("shifted_letter is now set to ", shifted_letter))

	text_edit.insert_text_at_caret(letter if EditorGlobals.shift_state == 0 else shifted_letter, -1)
	# insert letter if shift is not pressed, otherwise insert shifted_letter
	# second argument is caret id, -1 means all carets

	if EditorGlobals.shift_state == 1:
		# reset shift state if it was not caps locked
		EditorGlobals.shift_state = 0

