extends Control

@onready var score_counter: Label = $ScoreCounter
@onready var timer: Timer = $ScoreTimer
@onready var tutorial: Label = $Tutorial
@onready var start_button: TextureButton = %StartButton
@onready var settings_button: TextureButton = %SettingsButton
@onready var exit_button: TextureButton = %ExitButton
@onready var pause_button: TextureButton = %PauseButton
@onready var retry_button: TextureButton = %RetryButton
@onready var game: Node2D = $".."
@onready var fail_menu: Node2D = $".."

var score = 0

func _ready() -> void:
	if (get_parent() == game):
		retry_button.visible = false
		retry_button.disabled = true
		
	pause_button.visible = false
	pause_button.disabled = true

func _process(delta: float) -> void:
	if (get_parent() == fail_menu):
		start_button.visible = false
		settings_button.visible = false
		retry_button.visible = true
		exit_button.visible = true
		pause_button.visible = false
	tutorial.position.x -= 50 * delta

func add_score() -> void:
	score += 5
	score_counter.text = str(score)

func _on_score_timer_timeout() -> void:
	score += 1
	score_counter.text = str(score)

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
	get_tree().quit(0)

func _on_retry_button_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file", "res://game.tscn")

func _on_pause_button_pressed() -> void:
	Engine.time_scale = 0
	pause_button.visible = false
	pause_button.disabled = true
	
	start_button.visible = true
	start_button.disabled = false
	
	exit_button.visible = true
	exit_button.disabled = false
	exit_button.position = Vector2(94,34)
