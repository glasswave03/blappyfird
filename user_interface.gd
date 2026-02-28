extends Control

@onready var score_counter: Label = $ScoreCounter
@onready var timer: Timer = $ScoreTimer
@onready var tutorial: Label = $Tutorial

var score = 0

func _process(delta: float) -> void:
	tutorial.position.x -= 50 * delta

func add_score():
	score += 5
	score_counter.text = str(score)

func _on_score_timer_timeout() -> void:
	score += 1
	score_counter.text = str(score)
