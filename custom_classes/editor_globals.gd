extends Node
## This class contains global variables. Wow. I've just opened America to yall.

# VARIABLES
## Shift state. 0 = not pressed, 1 = pressed, 2 = caps locked.
## If 1, key.gd should reset to 0 when pressed.
@export var shift_state: int = 0 :
	set(value):
		if value < 0 or value > 2:
			push_error(str("value (",value,") is < 0 or > 2"))
			return
		shift_state = value
		shift_state_changed.emit(value)

## TextEdit containing the code.
@export var text_edit: TextEdit

## Container that lists projects.
@export var project_list_container: Node

## List of projects in format of "name": {"path": "/storage/..."}
## Used by project picker buttons
@export var projects: Dictionary

## Project currently loaded in. (in form of {name: "123", path: "/storage/..."})
@export var current_project: Dictionary

## Current logfile's name. (Log 2024 3 29_10 52 3.txt)
@export var log_name: String

# SIGNALS
## Fires when shift_state is changed
signal shift_state_changed(new_state: int)
