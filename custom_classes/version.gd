class_name VersionLabel extends Label
## A Label that reads through version.txt stored in the project root and
## appends its contents to 'your_label'.


## String the version will be appended to.
@export var your_label: String = "v"

func _ready():
	var file = FileAccess.open("res://version.txt", FileAccess.READ)
	var version = file.get_as_text()
	
	text = your_label+version
