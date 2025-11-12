extends Area2D

@export var prochaine_scene_path: String = "res://scenes/niveau_02.tscn"

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file(prochaine_scene_path)
