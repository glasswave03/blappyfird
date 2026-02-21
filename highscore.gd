extends Label

func _ready() -> void:
	text = "Highscore: " + str(SaveLoad.contents_to_save.highscore)
