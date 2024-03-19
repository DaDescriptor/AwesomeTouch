class_name LineCounter extends Label
## A Label that follows a TextEdit and displays it's amount of lines,
## like in a code editor.


## TextEdit to follow.
@export var text_edit: TextEdit

func _process(_delta):
	if !text_edit:
		return
	
	var lines: int = text_edit.get_line_count()
	
	text = ''
	
	for line in lines:
		text = str(text, line+1, "\n")
		for wrap in text_edit.get_line_wrap_count(line):
			text = str(text, "\n")
		# str() is basically godot's way of .. operator
		# line+1 because indexes start from zero. why.
