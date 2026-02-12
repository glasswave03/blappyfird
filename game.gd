extends Node2D

@export var obstacle_scene: PackedScene = preload("res://obstacle.tscn")
@export var coin_scene: PackedScene = preload("res://coin.tscn")
@onready var coin_timer: Timer = $Timers/CoinTimer
@onready var start_button: TextureButton = %StartButton
@onready var settings_button: TextureButton = %SettingsButton
@onready var exit_button: TextureButton = %ExitButton
@onready var pause_button: TextureButton = %PauseButton
@onready var tile_map_layer: TileMapLayer = $TileMapLayer

const SPEED = 50

func _ready() -> void:
	Engine.time_scale = 0
	pause_button.visible = false

func _process(delta: float) -> void:
	tile_map_layer.position.x -= SPEED * delta
	if tile_map_layer.position.x < -48:
		tile_map_layer.position.x = 256

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
	pause_button.visible = true
	start_button.queue_free()
	settings_button.queue_free()
	exit_button.queue_free()


func _on_settings_button_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://settings_menu.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().quit(0)


func _on_pause_button_pressed() -> void:
	Engine.time_scale = 0
	
