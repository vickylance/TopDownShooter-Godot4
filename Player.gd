extends CharacterBody2D
class_name Bullet

@export var BulletScene: PackedScene

@onready var end_of_gun := $EndOfGun as Marker2D

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
	var bullet_instance := BulletScene.instantiate()
	get_tree().root.add_child(bullet_instance)
	bullet_instance.global_position = end_of_gun.global_position
	var target := get_global_mouse_position()
	var direction_to_target = bullet_instance.global_position.direction_to(target)
	bullet_instance.rotation = rotation + bullet_instance.rotation
	bullet_instance.direction = direction_to_target
