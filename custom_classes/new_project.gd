extends Button
## Create a new project when pressed

@export var project_name: LineEdit
@export var project_location: LineEdit

func _pressed():
	print(str(
		"new project",
		"\nname: ", project_name.text,
		"\nlocation: ", project_location.text
	))
	
	if !DirAccess.dir_exists_absolute(project_location.text):
		print("location does not exist, creating..")
		DirAccess.make_dir_recursive_absolute(project_location.text)
	
	var handle = FileAccess.open("user://projects", FileAccess.WRITE_READ)
	# project picker should have already made this file, no problem should happen
	# keyword 'should'
	var list = handle.get_var() if handle.get_var() != null else []
	print(list, handle.get_var(), handle)
	list.append({"name": project_name.text, "path": project_location.text})
	print(list)
	handle.seek(0)
	handle.store_var(list)
	handle.flush()
	
	get_tree().root.get_node("Project Picker").load_projects()
	get_tree().root.get_node("ProjectDialog").queue_free()
