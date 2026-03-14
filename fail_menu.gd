extends Control

@onready var highscore: Label = %Highscore
@onready var score: Label = %Score

func _ready() -> void:
	if ("user://save.json"):
		Global._load()
	if (Global.score > Global.contents_to_save.highscore):
		Global.contents_to_save.highscore = Global.score
	highscore.text = "Highscore: " + str(Global.contents_to_save.highscore)
	score.text = "Your score: " + str(Global.score)
	Global._save()

func _on_retry_button_pressed() -> void:
	Global.score = 0
	Global.game_manager.change_world("res://game.tscn")
	Global.game_manager.change_gui("res://main_menu.tscn")

func _on_exit_button_pressed() -> void:
	get_tree().quit(0)
