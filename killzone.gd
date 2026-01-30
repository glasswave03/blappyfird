extends Area2D

var fail_scene = preload("res://fail_menu.tscn").instantiate()

func _on_body_entered(_body: Node2D) -> void:
	get_tree().call_deferred("change_scene_to_file", "res://fail_menu.tscn")
