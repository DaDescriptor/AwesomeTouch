extends Button
## queue free a selected node when pressed

@export var node: Node

func _pressed():
	node.queue_free()
