extends Control

@onready var tutorial: Label = $Tutorial
@onready var pause_button: TextureButton = %PauseButton
@onready var start_button: TextureButton = %StartButton
@onready var exit_button: TextureButton = %ExitButton
@onready var score_counter: Label = $ScoreCounter

func _ready() -> void:
	start_button.position = Vector2(92, 0)
	start_button.visible = false
	
	exit_button.position = Vector2(92, 17)
	exit_button.visible = false
	
	pause_button.position = Vector2(222, -76)

func _process(delta: float) -> void:
	tutorial.position.x -= 80 * delta
	if (get_tree().paused == true):
		pause_button.visible = false
	else: pause_button.visible = true
	var currentScore = 0
	if (Global.score != currentScore):
		score_counter.text = str(Global.score)

func _on_pause_button_pressed() -> void:
	get_tree().paused = true
	pause_button.visible = false
	start_button.visible = true
	exit_button.visible = true

func _on_start_button_pressed() -> void:
	self.visible = true
	get_tree().paused = false
	pause_button.visible = true
	start_button.visible = false
	exit_button.visible = false

func _on_exit_button_pressed() -> void:
	get_tree().quit(0)

func add_score():
	Global.score += 5
	score_counter.text = str(Global.score)
