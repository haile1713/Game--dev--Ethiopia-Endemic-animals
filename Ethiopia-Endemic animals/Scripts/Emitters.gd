extends Node2D

var timer
var game_type = "Hard"
var limit = 0

@onready var global = get_node("/root/Globals")

var choices = [ preload("res://Scenes/BlueProjectile.tscn"), 
				preload("res://Scenes/GreenProjectile.tscn"), 
				preload("res://Scenes/RedProjectile.tscn"),
				preload("res://Scenes/PurpleProjectile.tscn"),
				preload("res://Scenes/OrangeProjectile.tscn"),
				preload("res://Scenes/YellowProjectile.tscn"),
				preload("res://Scenes/DiffGreenProjectile.tscn"),
				preload("res://Scenes/DiffBlueProjectile.tscn"),
				preload("res://Scenes/DiffRedProjectile.tscn") ]
				
var emitters = [get_node("LeftEmitter"), get_node("MiddleEmitter"), get_node("RightEmitter")]

func _ready():
	pass
	
func _process(delta):
	pass
		
func begin_game():
	timer = get_node("Timer")
	timer.set_wait_time(global.emit_time)
	timer.start()

func _on_Timer_timeout():
	randomize()
	var projectile = choices[int(randf_range(0, global.projectile_limit))].instantiate()
	add_child(projectile)
	
	randomize()
	var emit = int(randf_range(1, 4))
	if emit == 1:
		projectile.position = get_node("LeftEmitter").position
	if emit == 2:
		projectile.position = get_node("MiddleEmitter").position
	if emit == 3:
		projectile.position = get_node("RightEmitter").position

	projectile.y_speed = int(global.projectile_speed)
	if (global.game_over == false):
		timer.set_wait_time(global.emit_time)
		timer.start()
	else:
		timer.stop()
		
func move(target: Vector2):
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", target, 2.0)
