extends Area2D

var fail_scene = preload("res://fail_menu.tscn").instantiate()
@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	timer.start(1)
	Engine.time_scale = 0.5
	body.velocity = Vector2(0,0)
	if (timer.is_stopped()): timer.timeout.emit()

func _on_timer_timeout():
	get_tree().call_deferred("change_scene_to_file", "res://fail_menu.tscn")
