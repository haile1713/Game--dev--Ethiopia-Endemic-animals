extends Node2D

@onready var global = get_node("/root/Globals")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if global.score > global.get_high_score("HighScores", global.current_mode):
		global.save_item("HighScores", global.current_mode, global.score)
		
		get_node("HighScore").text = "High Score: " + str(int(global.score))
		
	if global.score >= 0:
		get_node("Score").text = str(int(global.score))
	
	if global.score < 0:
		get_node("EndOptions").move(Vector2(0, -40))
		global.game_over = true
		get_node("Score").text = "END"

func move(target: Vector2):
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", target, 2.0)
