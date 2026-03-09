extends Label

func _ready() -> void:
	text = "Highscore: " + str(Global.contents_to_save.highscore)
