extends Area2D

var fail_scene = preload("res://fail_menu.tscn").instantiate()
@onready var timer: Timer = $Timer
@onready var pause_button: TextureButton = $"../../UserInterface/PauseButton"

func _on_body_entered(body: Node2D) -> void:
	timer.start(1)
	timer.ignore_time_scale = true
	Engine.time_scale = 0.5
	body.velocity = Vector2(0,0)
	if (timer.is_stopped()): timer.timeout.emit()
	get_tree().call_deferred("queue_delete", pause_button)

func _on_timer_timeout():
	get_tree().call_deferred("change_scene_to_file", "res://fail_menu.tscn")
