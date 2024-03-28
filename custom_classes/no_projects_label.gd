class_name NoProjectsLabel extends Label
## Will appear if it has no brother nodes, will disappear otherwise.

func _process(_delta):
	visible = $"..".get_child_count() == 1
