extends Node


var menu_open: bool = false

func _notification(what):
	if what == NOTIFICATION_WM_CLOSE_REQUEST or what == NOTIFICATION_WM_GO_BACK_REQUEST:
		print("exit initiated")
		
		if menu_open:
			print("exiting!")
			get_tree().quit()
			return
		
		menu_open = true
		
		var decide = func(choice):
			if choice == "exit":
				print("exiting!")
				get_tree().quit()
			menu_open = false
		
		DialogManager.push_dialog("Hey",
		"Do you want to exit?
Your work might get lost if it's not saved!",
		{"exit": "Exit", "cancel": "Cancel"},
		decide)
