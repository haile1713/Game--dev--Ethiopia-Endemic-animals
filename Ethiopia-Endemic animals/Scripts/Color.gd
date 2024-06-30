extends TextureButton

@onready var global = get_node("/root/Globals")

@export var color: String

func _ready():
	pass # Replace with function body.

func ChangeColor():
	global.current_color = color
