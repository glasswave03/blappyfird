extends Area2D

var fail_scene = preload("res://fail_menu.tscn").instantiate()
@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	timer.start(1)
	timer.ignore_time_scale = true
	Engine.time_scale = 0.5
	body.velocity = Vector2(0,0)
	# TODO: switch player to dead player sprite, make it fall on the ground 
	# TODO: change GUI scene to fail screen with highscore and score of the just failed run
	
	#var pos = get_node("World/Game/Player").position
	#var dead: Sprite2D
	#dead.position = pos
	if (timer.is_stopped()): timer.timeout.emit()

func _on_timer_timeout():
	Global.game_manager.change_gui("res://fail_menu.tscn")
