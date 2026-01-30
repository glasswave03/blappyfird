extends Control

@onready var score_counter: Label = $ScoreCounter

var score = 0

func add_score():
	score += 1
	score_counter.text = str(score)
