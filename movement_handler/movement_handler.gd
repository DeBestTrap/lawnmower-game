class_name MovementHandler
extends Node

@onready
var parent: Entity = get_parent()

# This is a virtual class, it should not be used directly
func _ready() -> void:
    pass

func get_movement_direction() -> Vector2:
    return Vector2.ZERO

func wants_to_jump() -> bool:
    return false

func jump_held() -> bool:
    return false
