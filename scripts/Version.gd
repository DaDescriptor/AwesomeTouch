# use this for labels that are displaying the app's version
# appends: your_label+version.txt
extends Label

@export var your_label: String = "v"

func _ready():
	var file = FileAccess.open("res://version.txt", FileAccess.READ)
	var version = file.get_as_text()
	
	text = your_label+version
