extends Node2D

@export var obstacle_scene: PackedScene = preload("res://obstacle.tscn")
@export var coin_scene: PackedScene = preload("res://coin.tscn")
@onready var coin_timer: Timer = $Timers/CoinTimer
@onready var start_button: Button = $StartButton

func _ready() -> void:
	Engine.time_scale = 0

func _on_obstacle_timer_timeout() -> void:
	var obstacle = inst(obstacle_scene)
	obstacle.scale.y = randf_range(2, 7.5)
	

func _on_coin_timer_timeout() -> void:
	inst(coin_scene)
	coin_timer.start(randf_range(1.5, 5))
	
func inst(scene: PackedScene) -> Node2D:
	var obj = scene.instantiate()
	var spawn = Vector2(250, randf_range(-80, 80))
	obj.position = spawn
	add_child(obj)
	return obj

func _on_start_button_pressed() -> void:
	Engine.time_scale = 1
	start_button.queue_free()
