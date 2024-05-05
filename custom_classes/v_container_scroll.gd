class_name VContainerScrollBar extends VScrollBar
## A standalone scrollbar that binds to a scroll container and controls it.
## Only vertical scrolling support because fuck you.


## ScrollContainer this scrollbar is binded to.
@export var scroll_container: ScrollContainer
## ScrollContainer's child node (usually VBoxContainer) used to determine scroll's size.
## If not set will try to find automatically.
@export var scroll_contents: Control

func _process(_dt):
	if scroll_container != null:
		max_value = scroll_contents.size.y
		page = scroll_container.size.y
		
		scroll_container.scroll_vertical = value
		# LINTER SHUT THE FUCK UP
