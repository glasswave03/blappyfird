extends Control

func _ready() -> void:
	%Options.select(Global.player_type)

func _on_back_button_pressed() -> void:
	Global.game_manager.change_gui("res://main_menu.tscn")

func _on_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0, value)

func _on_mute_button_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0, toggled_on)

func _on_control_options_item_selected(index: int) -> void:
	match index:
		0:
			Global.player_type = Global.PlayerType.DEFAULT
		1:
			Global.player_type = Global.PlayerType.MOUSE
		2:
			Global.player_type = Global.PlayerType.HOVER
		3:
			Global.player_type = Global.PlayerType.ZIGZAG
