extends Node
## Logs viewable in-game. Press Back on Android or ~ on keyboard to open.


var handle: FileAccess # handle used to write log files

var console_prefab = preload("res://custom_classes/console.tscn")
var console

var dialog_visible = false

enum MESSAGE_TYPE {
	PRINT,
	WARN,
	ERROR,
	FATAL
}

var colors = [
	"7f849c", # Print
	"f9e2af", # Warn
	"eba0ac", # Error
	"cba6f7"  # Fatal
]

func _notification(what):
	if what == NOTIFICATION_WM_GO_BACK_REQUEST or what == NOTIFICATION_WM_CLOSE_REQUEST:
		if dialog_visible:
			return
		dialog_visible = true
		create_console()
		
		var decide = func(opinion):
			if opinion == "console":
				open_console()
			elif opinion == "exit":
				get_tree().quit()
			dialog_visible = false
		
		DialogManager.push_dialog("Hey",
		"Do you want to exit or open the console?
		[color=#f38ba8]If in editor, your work might get lost![/color]",
		{"console": "Open console", "exit": "Quit app", "cancel": "Cancel"},
		decide
	)

func _ready():
	create_console()
	if !DirAccess.dir_exists_absolute("/storage/emulated/0/.atouch/logs"):
		DirAccess.make_dir_recursive_absolute("storage/emulated/0/.atouch/logs")
		# we should store logs somewhere right
	
	var version_file = FileAccess.open("res://version.txt", FileAccess.READ)
	var version = version_file.get_as_text()
	
	var datetime = Time.get_datetime_dict_from_system()
	var logname = str(
		"Log ",
		datetime.year, " ",
		datetime.month, " ",
		datetime.day, "_",
		datetime.hour, " ",
		datetime.minute, " ",
		datetime.second,
		".txt"
	) # example: Log 2024 3 29_10 20 5.txt
	print(str("Writing logs to: ", logname))
	
	EditorGlobals.log_name = logname
	
	handle = FileAccess.open(str("/storage/emulated/0/.atouch/logs/", logname), FileAccess.WRITE)
	write(str("AwesomeTouch v.", version," - welcome!"), MESSAGE_TYPE.PRINT)

func create_console():
	if console == null:
		console = console_prefab.instantiate()
		get_tree().root.add_child.call_deferred(console)
		# idk why but call_deferred will fix the console not opening on start

func open_console():
	console.visible = true

func write(text: String, type: MESSAGE_TYPE = MESSAGE_TYPE.PRINT):
	var color = colors[type]
	var label: RichTextLabel = console.get_node("Scroll/ConsoleLabel")
	label.append_text(str(
		"\n[color=#%s]" % color,
		Time.get_time_string_from_system(),
		"[/color] ",
		text
	))
	
	print(type, " ", text)
