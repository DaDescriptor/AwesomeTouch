class_name VContainerScrollBar extends VScrollBar
## A standalone scrollbar that binds to a scroll container and controls it.
## Only vertical scrolling support because fuck you


## ScrollContainer this scrollbar is binded to.
@export var scroll_container: ScrollContainer
## ScrollContainer's child node (usually VBoxContainer) used to determine scroll's size.
@export var scroll_contents: Control

func _process(_dt):
	if scroll_container == null:
		push_error("Scroll Contaner is not set!")
	if !scroll_container.is_class("ScrollContainer"):
		push_error("Scroll Container is not a ScrollContainer you moron!")
	if scroll_contents == null:
		scroll_contents = scroll_container.get_child(0)
		if scroll_contents == null:
			push_error("Failed to find missing Scroll Contents. set it manually moron")
	
	max_value = scroll_contents.size.y
	page = scroll_container.size.y
	
	scroll_container.scroll_vertical = value