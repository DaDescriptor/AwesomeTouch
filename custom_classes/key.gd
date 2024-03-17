class_name Key extends Button
## A GUI button which appends a character to a selected TextEdit.
## Automatically makes the text caps when shift is pressed.

## TextEdit that this key will insert text to.
@export var text_edit: TextEdit
## A letter this key will insert.
@export var letter: String
## What to insert when shift is enabled.
## If not set will turn `letter` into caps (if possible)
@export var shifted_letter: String

func _pressed():
	if text_edit == null:
		push_error("text_edit is not set.")
	if letter == null or letter == "":
		push_error("letter is not set.")
	if shifted_letter == null or shifted_letter == "":
		print("shifted_letter is not set, trying to autoset.")
