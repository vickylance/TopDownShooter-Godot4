extends CharacterBody2D


const SPEED := 300.0


func _physics_process(_delta: float) -> void:
	var input_axis := Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down")).normalized()
	if input_axis:
		velocity = input_axis * SPEED
	else:
		velocity = Vector2(move_toward(velocity.x, 0, SPEED), move_toward(velocity.y, 0, SPEED))
	move_and_slide()
	look_at(get_global_mouse_position())


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("shoot"):
		shoot()
	pass


func shoot() -> void:
	pass
