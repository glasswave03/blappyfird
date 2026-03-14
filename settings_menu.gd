extends Control


func _on_back_button_pressed() -> void:
	Global.game_manager.change_gui("res://main_menu.tscn")
