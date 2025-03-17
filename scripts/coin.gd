extends Area2D
@onready var coin_player: AudioStreamPlayer2D = $AudioStreamPlayer2D


var is_collected = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_body_entered(_body: Node2D) -> void:
	if not is_collected:
		is_collected = true
		GameManager.total_coins += 1
		coin_player.play()
		print('+1 coin')
		hide()
