extends Node2D

@export var obstacle_scene: PackedScene = preload("res://obstacle.tscn")
@export var coin_scene: PackedScene = preload("res://coin.tscn")
@onready var coin_timer: Timer = $Timers/CoinTimer
@onready var start_button: TextureButton = %StartButton
@onready var settings_button: TextureButton = %SettingsButton
@onready var exit_button: TextureButton = %ExitButton
@onready var pause_button: TextureButton = %PauseButton
@onready var tile_map_layer: TileMapLayer = $TileMapLayer
@onready var user_interface: Control = $UserInterface

const SPEED = 50

func _ready() -> void:
	Engine.time_scale = 0
	pause_button.visible = false
	pause_button.disabled = true

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

func _on_start_button_pressed() -> void:
	Engine.time_scale = 1
	pause_button.visible = true
	pause_button.disabled = false
	
	start_button.visible = false
	start_button.disabled = true
	
	exit_button.visible = false
	exit_button.disabled = true
	if (settings_button):
		settings_button.queue_free()


func _on_settings_button_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://settings_menu.tscn")


func _on_exit_button_pressed() -> void:
	if (user_interface.score > SaveLoad.contents_to_save.highscore):
		SaveLoad.contents_to_save.highscore = user_interface.score
		SaveLoad._save()
	get_tree().quit(0)


func _on_pause_button_pressed() -> void:
	Engine.time_scale = 0
	pause_button.visible = false
	pause_button.disabled = true
	
	start_button.visible = true
	start_button.disabled = false
	
	exit_button.visible = true
	exit_button.disabled = false
	exit_button.position = Vector2(94,34)
