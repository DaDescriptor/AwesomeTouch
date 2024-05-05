extends Control
## Controls the FileDialog


func on_dir_selected(dir):
	$Value.text = dir # it's already a string

func show_picker():
	$FileDialog.visible = true
