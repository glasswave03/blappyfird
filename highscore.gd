extends Label
@onready var user_interface: Control = $"../UserInterface"

func _ready() -> void:
	if (user_interface.score > SaveLoad.contents_to_save.highscore):
		SaveLoad.contents_to_save.highscore = user_interface.score
		SaveLoad._save()
	else: SaveLoad._load()
	print(SaveLoad.contents_to_save.highscore)
	var score = SaveLoad.contents_to_save.highscore
	text = "Highscore: " + str(score)
