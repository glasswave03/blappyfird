extends Area2D

@onready var score_counter: Label = $"../ScoreCounter"

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	
	queue_free()
