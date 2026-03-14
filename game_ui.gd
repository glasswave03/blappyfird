extends Control

@onready var tutorial: Label = $Tutorial
@onready var pause_button: TextureButton = %PauseButton
@onready var start_button: TextureButton = %StartButton
@onready var exit_button: TextureButton = %ExitButton
@onready var score_counter: Label = $ScoreCounter

func _ready() -> void:
	start_button.position = Vector2(98, 0)
	start_button.visible = false
	
	exit_button.position = Vector2(98, 17)
	exit_button.visible = false
	
	pause_button.position = Vector2(222, -76)

func _process(delta: float) -> void:
	tutorial.position.x -= 50 * delta
	if (Engine.time_scale < 1):
		pause_button.visible = false
	else: pause_button.visible = true
	score_counter.text = str(Global.score)


func _on_pause_button_pressed() -> void:
	Engine.time_scale = 0
	pause_button.visible = false
	start_button.visible = true
	exit_button.visible = true


func _on_start_button_pressed() -> void:
	Engine.time_scale = 1
	pause_button.visible = true
	start_button.visible = false
	exit_button.visible = false


func _on_exit_button_pressed() -> void:
	get_tree().quit(0)
