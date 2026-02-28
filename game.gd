extends Node2D

@export var obstacle_scene: PackedScene = preload("res://obstacle.tscn")
@export var coin_scene: PackedScene = preload("res://coin.tscn")
@onready var coin_timer: Timer = $Timers/CoinTimer
@onready var tile_map_layer: TileMapLayer = $TileMapLayer
@onready var user_interface: Control = $UserInterface

const SPEED = 50

func _ready() -> void:
	Engine.time_scale = 0

func _process(delta: float) -> void:
	tile_map_layer.position.x -= SPEED * delta
	if tile_map_layer.position.x < -48:
		tile_map_layer.position.x = 256
	

func _on_obstacle_timer_timeout() -> void:
	var obstacle_top = inst(obstacle_scene)
	var obstacle_bot = inst(obstacle_scene)
	obstacle_bot.rotation_degrees = 180
	
	obstacle_top.scale.y = 4
	obstacle_bot.scale.y = 4
	
	obstacle_top.position = Vector2(250, randf_range(-80, -48))
	obstacle_bot.position = Vector2(250, randf_range(32, 96))
	#while ((obstacle_bot.position.y - obstacle_top.position.y) < 40):
	#	obstacle_top.position = Vector2(250, randf_range(-80, -48))
	#	obstacle_bot.position = Vector2(250, randf_range(32, 112))
	

func _on_coin_timer_timeout() -> void:
	var coin = inst(coin_scene)
	coin.position = Vector2(250, randf_range(-80, 60))
	coin_timer.start(randf_range(1.5, 5))
	
func inst(scene: PackedScene) -> Node2D:
	var obj = scene.instantiate()
	add_child(obj)
	return obj
