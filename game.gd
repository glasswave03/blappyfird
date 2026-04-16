extends Node2D

const obstacle_scene: PackedScene = preload("res://obstacle.tscn")
const coin_scene: PackedScene = preload("res://coin.tscn")
const cloud_scene: PackedScene = preload("res://cloud.tscn")
const player_default_scene: PackedScene = preload("res://player.tscn")
const player_mouse_scene: PackedScene = preload("res://player_mouse.tscn")
const player_hover_scene: PackedScene = preload("res://player_hover.tscn")
const player_zigzag_scene: PackedScene = preload("res://player_zigzag.tscn")

@onready var coin_timer: Timer = $Timers/CoinTimer
@onready var cloud_timer: Timer = $Timers/CloudTimer
@onready var obstacle_timer: Timer = $Timers/ObstacleTimer
@onready var tile_map_layer: TileMapLayer = $TileMapLayer

const MAP_EDGE_RIGHT := 280
const MAP_EDGE_LEFT := -160
const COIN_SPEED_MULTIPLIER := 1.2
# SPEED
const SPEED_CAP := 200.0
const SPEED_GRADIENT := 1.05
var SPEED_INCREASE := 2.0
var SPEED := 80.0
# TIME
const TIME_CAP := 0.8
const TIME_DECREASE := 0.05
var TIME := 2.0
# RANGE
const RANGE_CAP := Vector2(-80, 64)
const RANGE_DECREASE := 0.5
var top_range := Vector2(-122, -48)
var bot_range := Vector2(32, 104)

func _ready() -> void:
	_add_player()
	Global._save()
	get_tree().paused = false

func _process(delta: float) -> void:
	tile_map_layer.position.x -= SPEED * delta
	if tile_map_layer.position.x < MAP_EDGE_LEFT:
		tile_map_layer.position.x = 256

func _add_player() -> CharacterBody2D:
	var player: CharacterBody2D
	match Global.player_type:
		Global.PlayerType.DEFAULT:
			player = inst(player_default_scene)
		Global.PlayerType.MOUSE:
			player = inst(player_mouse_scene)
		Global.PlayerType.HOVER:
			player = inst(player_hover_scene)
		Global.PlayerType.ZIGZAG:
			player = inst(player_zigzag_scene)
	player.position = Vector2(0,0)
	return player

func _on_obstacle_timer_timeout() -> void:
	obstacle_timer.start(TIME)
	var obstacle_top = inst(obstacle_scene)
	var obstacle_bot = inst(obstacle_scene)
	obstacle_bot.rotation_degrees = 180
	obstacle_top.SPEED = SPEED
	obstacle_bot.SPEED = SPEED
	# 4 * 16 => height == 64 px
	obstacle_top.scale.y = 4
	obstacle_bot.scale.y = 4
	
	obstacle_top.position = Vector2(MAP_EDGE_RIGHT, randf_range(top_range.x, top_range.y))
	obstacle_bot.position = Vector2(MAP_EDGE_RIGHT, randf_range(bot_range.x, bot_range.y))

func _on_coin_timer_timeout() -> void:
	var coin = inst(coin_scene)
	coin.SPEED = SPEED * COIN_SPEED_MULTIPLIER
	coin.position = Vector2(MAP_EDGE_RIGHT, randf_range(-72, 60))
	coin_timer.start(randf_range(1.5, 5))
	
func inst(scene: PackedScene) -> Node2D:
	var obj = scene.instantiate()
	add_child(obj)
	return obj

func _on_score_timer_timeout() -> void:
	Global.score += 1
	if TIME > TIME_CAP: 
		TIME -= TIME_DECREASE
		print(TIME)
	else: TIME = TIME_CAP
	if top_range.x < RANGE_CAP.x or bot_range.y > RANGE_CAP.y:
		top_range.x += RANGE_DECREASE
		bot_range.y -= RANGE_DECREASE
		print("top_range_x: " + str(top_range.x) + ", bot_range_y: " + str(bot_range.y))
	else: 
		top_range.x = RANGE_CAP.x
		bot_range.y = RANGE_CAP.y
	if SPEED < SPEED_CAP: 
		SPEED += SPEED_INCREASE
		SPEED_INCREASE *= SPEED_GRADIENT
		print(SPEED)
	else: SPEED = SPEED_CAP

func _on_cloud_timer_timeout() -> void:
	var cloud = inst(cloud_scene)
	var speed: float = SPEED + randf_range(10, 50)
	cloud.speed = speed
	cloud.position = Vector2(MAP_EDGE_RIGHT, randf_range(-72, 60))
	if (randi()%2 < 1):
		cloud.get_child(0).visible = false
		cloud.get_child(1).visible = true
	else: 
		cloud.get_child(0).visible = true
		cloud.get_child(1).visible = false
	cloud_timer.start(randf_range(2, 5))
