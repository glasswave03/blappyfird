extends Control

@onready var tutorial: Label = $Tutorial
@onready var pause_button: TextureButton = %PauseButton
@onready var start_button: TextureButton = %StartButton

var game_manager: GameManager

func _ready() -> void:
	Global.game_manager = self

func _process(delta: float) -> void:
	tutorial.position.x += 50 * delta

func _on_pause_button_pressed() -> void:
	Engine.time_scale = 0
	pause_button.visible = false
	start_button.visible = true


func _on_start_button_pressed() -> void:
	Engine.time_scale = 1
	pause_button.visible = true
	start_button.visible = false


func _on_exit_button_pressed() -> void:
	get_tree().quit(0)
