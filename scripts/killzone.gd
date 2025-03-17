extends Area2D
@onready var timer: Timer = $Timer
@onready var player: CharacterBody2D = $"/root/Game/Player"


func _on_body_entered(body: Node2D) -> void:
	print('you died!!')
	Engine.time_scale = 0.5
	timer.start()
	body.get_node("CollisionShape2D").queue_free()


func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	Engine.time_scale = 1
	GameManager.total_coins=0
