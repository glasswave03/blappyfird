extends Control

@onready var start_button: TextureButton = $StartButton
@onready var settings_button: TextureButton = $SettingsButton
@onready var exit_button: TextureButton = $ExitButton


func _ready() -> void:
	start_button.position = Vector2(92, 17)
	settings_button.position = Vector2(92, 34)
	exit_button.position = Vector2(92, 51)

func _on_settings_button_pressed() -> void:
	Global.game_manager.change_world("res://menu_screen.tscn")
	Global.game_manager.change_gui("res://settings_menu.tscn")
	

func _on_start_button_pressed() -> void:
	get_tree().paused = false
	Global.game_manager.change_world("res://game.tscn")
	Global.game_manager.change_gui("res://game_ui.tscn")

func _on_exit_button_pressed() -> void:
	get_tree().quit(0)
