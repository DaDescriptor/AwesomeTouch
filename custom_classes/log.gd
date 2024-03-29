extends Node
## Logs viewable in-game. Press Back on Android or ~ on keyboard to open.


var handle: FileAccess # handle used to write log files

# var console_prefab = preload("res://custom_classes/console.tscn")
var console

func _ready():
	if !DirAccess.dir_exists_absolute("/storage/emulated/0/.atouch/logs"):
		DirAccess.make_dir_recursive_absolute("storage/emulated/0/.atouch/logs")
		# we should store logs somewhere right
		
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
	print(str("Writing logs to: ", logname, ".txt"))
	
	handle = FileAccess.open(str("/storage/emulated/0/.atouch/logs/", logname), FileAccess.WRITE)

func write(text: String):
	pass
