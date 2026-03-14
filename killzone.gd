extends Area2D

var fail_scene = preload("res://fail_menu.tscn").instantiate()
@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	# TODO: switch player to dead player sprite, make it fall on the ground 
	#var pos = get_node("World/Game/Player").position
	#var dead: Sprite2D
	#dead.position = pos
	body.queue_free()
	Global.game_manager.clear_gui()
	timer.start(1)
	timer.ignore_time_scale = true
	Engine.time_scale = 0.5
	
	if (timer.is_stopped()): timer.timeout.emit()

func _on_timer_timeout():
	Global.game_manager.change_world("res://fail_screen.tscn")
	Global.game_manager.change_gui("res://fail_menu.tscn")
