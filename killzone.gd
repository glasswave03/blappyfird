extends Area2D

func _on_body_entered(body: Node2D) -> void:
	print("death")
	get_tree().change_scene_to_file("res://fail_menu.tscn")
