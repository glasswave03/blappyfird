class_name GameManager extends Node

@export var gui: Control
@export var world: Node2D
@export var score: int = 0

@onready var score_counter: Label = $GUI/GameUI/ScoreCounter

var current_gui
var current_world

func _ready() -> void:
	Global.game_controller = self
	current_gui = $GUI/MainMenu

func add_score():
	score += 5
	score_counter.text = str(score)

func _on_score_timer_timeout() -> void:
	score += 1
	score_counter.text = str(score)
