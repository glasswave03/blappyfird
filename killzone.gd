extends Area2D

var dead_player_scene = preload("res://dead_player.tscn").instantiate()
@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	var pos = body.position
	var dead_player = dead_player_scene
	
	dead_player.position = pos
	Global.game_manager.get_child(0).call_deferred("add_child", dead_player)
	body.queue_free()
	
	Global.game_manager.clear_gui()
	timer.start(1)
	timer.ignore_time_scale = true
	Engine.time_scale = 0.5
	
	if (timer.is_stopped()): timer.timeout.emit()

func _on_timer_timeout():
	Global.game_manager.change_world("res://fail_screen.tscn")
	Global.game_manager.change_gui("res://fail_menu.tscn")
