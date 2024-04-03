class_name Caret extends Control
## Acts as a caret, because default one is being hiden while unfocused.
## dirty hack, i'm covered in shit

## Controls how fast will the cursor blink, set by EditorGlobals.
var blink_speed: float = EditorGlobals.blink_speed
## Self-explanatory.
var blink_timer: float = blink_speed



func _process(delta):
	position = EditorGlobals.text_edit.get_caret_draw_pos() + Vector2(24, -32)

	# how the timer works:
	# first, we set blink_timer to blink_speed
	#  [##########*]
	#  -1    0    1
	# (-1 and 1 are replaced by blink_speed)

	#  [#####*#####]
	#  -1    0    1
	# when it reaches zero, the caret hides:
	if blink_timer <= 0:
		visible = false

	#  [*##########]
	#  -1    0    1
	# when it reaches negative blink_speed, the caret enables and timer resets:
	if blink_timer <= -blink_speed:
		visible = true
		blink_timer = blink_speed

	# subtract delta from the timer so it ticks down:
	blink_timer -= delta
