extends Button
## queue free a selected node when pressed

@export var node: Node

func _pressed():
	var decide = func(choice):
		if choice == "exit":
			node.queue_free()
	
	DialogManager.push_dialog("Are you sure?",
"Are you sure you want to exit?
[color=#f38ba8]Unsaved work will be lost![/color]",
	{"exit": "Exit", "cancel": "Cancel"},
	decide)
