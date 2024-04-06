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
@export var current_project: Dictionary = {"name": "UNKNOWN PROJECT", "path": "UNKNOWN PATH"}

## Current logfile's name. (Log 2024 3 29_10 52 3.txt)
@export var log_name: String = "UNKNOWN LOG NAME"

## Editor version. (version.txt is now deprecated luckily :D)
@export var version: String = ProjectSettings.get_setting_with_override("application/config/version")

## Full path to the file that is currently edited
@export var current_file: String = "FILE NOT LOADED" :
	set(value):
		current_file = value
		short_file = value.get_file()

## Full path to the directiory that is currently explored in FM
@export var current_dir: String = "DIRECTORY NOT LOADED" :
	set(value):
		current_dir = value
		short_dir = str("/", current_dir.erase(0, current_project.path.length()))
		# add "/" so it looks like /src/123/ instead of src/123/

## Path to current_dir without the project path (current_project.path).
## For displaying.
@export var short_dir: String = "DIRECTORY NOT LOADED"

## Just the filename
@export var short_file: String = "FILE NOT LOADED"

## Editor cursor blink speed
@export var blink_speed: float = 0

## Syntax highlighting color scheme
@export var syntax_colors = {
	"keyword" = Color("CBA6F7"), 			# if, break, local, etc.
	"operator" = Color("89DCEB"), 			# =, ~=, +, etc.
	"var_name" = Color("F9E2AF"), 			# local >very_interesting_variable<
	"escape" = Color("FAB387"), 			# \n
	"builtin_method" = Color("F38BA8"), 	# >print<()
	"brackets" = Color("A6E3A1"), 			# print>()<
	"key" = Color("89B4FA"), 				# {>[<key>]< = value}
	"table" = Color("F38BA8"), 				# >{<[key] = value>}<
	"string" = Color("A6E321"), 			# ", ', [[[, ]]]
	"comment" = Color("EC7086"), 			# -- hi this is a comment
	"user_method" = Color("89B4FA") 		# function >hi<(), >hi<(), etc.
}

# SIGNALS
## Fires when shift_state is changed
signal shift_state_changed(new_state: int)
## Fires when a key is pressed
signal key_pressed(key: String)
