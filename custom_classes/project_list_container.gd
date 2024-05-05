class_name ProjectListContainer extends Node
## Reports itself to EditorGlobals.

func _ready():
	EditorGlobals.project_list_container = self
