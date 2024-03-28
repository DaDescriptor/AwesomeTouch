class_name ProjectPicker extends Control
## Fetch projects and load them in.

## Scene containing the project entry template
var project_button = preload("res://custom_classes/project_button.tscn")


func load_projects():
	var project_list = [] # this will be pushed into editor globals later
	
	var project_container = EditorGlobals.project_list_container
	
	for child in project_container.get_children():
		# remove all list entries so they won't be duplicated
		if "ignore_project" in child.get_groups():
			return # do not delete the label showing there is no projects
			# it will hide itself if there are any other entries
		
		child.queue_free() # what a silly way to pronounce "delete"
	
	var handle = FileAccess.open("user://projects", FileAccess.WRITE)
	
	if !FileAccess.file_exists("user://projects"):
		print("Projects file does not exist!")
		handle.store_var({})
		handle.close()
		return
		# we have to return because if a file does not exist get_file_as_string
		# will crash the entire project and if it's empty there is no need to
		# iterate over it
		# 
		# (STOP) <- beware!
		#   ||   <- this is a stop sign! 
		#   ||   <- it means you have to stop!
		# woah. turns out iterating through an empty file also crashes!
		# fantastic. fan. fucking. tastic.
	
	
	
	for project in handle.get_var():
		if typeof(project) != TYPE_DICTIONARY:
			# project entries consist of [name, path]
			push_error(str(
				"Project parsing denied: not a dictionary",
				"\nType: ", type_string(project),
				"\nValue: ", project
			))
			return
		
		var button = project_button.instantiate()
		project_container.add_child(button)
		
		button.get_node(button["Name"]).text = project.name
		button.name = project.name
		
		project_list.append({
			"name": project.name,
			"path": project.path
		})
	
	EditorGlobals.projects = project_list # push the new list

func _ready():
	load_projects()
	# yes i can add a button to manually refresh the page but why
