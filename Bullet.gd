extends Area2D

@export var speed := 2000

var direction := Vector2.ZERO

func _process(delta: float) -> void:
	if direction != Vector2.ZERO:
		var velocity = direction * speed * delta
		global_position += velocity


func set_direction(_direction: Vector2) -> void:
	self.direction = _direction
