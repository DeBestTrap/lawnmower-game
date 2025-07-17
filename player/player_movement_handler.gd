class_name PlayerMovementHandler
extends MovementHandler

var jump_buffered: bool = false

func _ready() -> void:
    super._ready()

func get_movement_direction() -> Vector2:
    return Input.get_vector("move_left", "move_right", "move_up", "move_down")

func wants_to_jump() -> bool:
    return Input.is_action_just_pressed("jump")

func jump_held() -> bool:
    return Input.is_action_pressed("jump")
