extends Node2D

const obstacle_scene: PackedScene = preload("res://obstacle.tscn")
const coin_scene: PackedScene = preload("res://coin.tscn")
const cloud_scene: PackedScene = preload("res://cloud.tscn")
@onready var coin_timer: Timer = $Timers/CoinTimer
@onready var cloud_timer: Timer = $Timers/CloudTimer
@onready var tile_map_layer: TileMapLayer = $TileMapLayer
@onready var player: CharacterBody2D = $Player

const MAP_EDGE_RIGHT = 280
const MAP_EDGE_LEFT = -80
const SPEED = 50

func _ready() -> void:
	Global._save()
	Engine.time_scale = 0

func _process(delta: float) -> void:
	tile_map_layer.position.x -= SPEED * delta
	if tile_map_layer.position.x < MAP_EDGE_LEFT:
		tile_map_layer.position.x = 256

func _on_obstacle_timer_timeout() -> void:
	var obstacle_top = inst(obstacle_scene)
	var obstacle_bot = inst(obstacle_scene)
	obstacle_bot.rotation_degrees = 180
	
	obstacle_top.scale.y = 4
	obstacle_bot.scale.y = 4
	
	obstacle_top.position = Vector2(MAP_EDGE_RIGHT, randi_range(-122, -48))
	obstacle_bot.position = Vector2(MAP_EDGE_RIGHT, randi_range(32, 104))
	

func _on_coin_timer_timeout() -> void:
	var coin = inst(coin_scene)
	coin.position = Vector2(MAP_EDGE_RIGHT, randf_range(-72, 60))
	coin_timer.start(randf_range(1.5, 5))
	
func inst(scene: PackedScene) -> Node2D:
	var obj = scene.instantiate()
	add_child(obj)
	return obj


func _on_score_timer_timeout() -> void:
	Global.score += 1


func _on_cloud_timer_timeout() -> void:
	var cloud = inst(cloud_scene)
	var speed: float = randf_range(20, 100)
	cloud.speed = speed
	cloud.position = Vector2(MAP_EDGE_RIGHT, randf_range(-72, 60))
	if (randi()%2 < 1):
		cloud.get_child(0).visible = false
		cloud.get_child(1).visible = true
	else: 
		cloud.get_child(0).visible = true
		cloud.get_child(1).visible = false
	cloud_timer.start(randf_range(2, 5))
	
