extends Node2D

@onready var global = get_node("/root/Globals")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
	
func move(target: Vector2):
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", target, 2.0)
