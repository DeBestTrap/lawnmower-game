class_name Entity
extends CharacterBody2D

@export
var speed: float = 100.0
@export
var jump_speed: float = 100.0
@export
var falling_multiplier: float = 0.25

var movement_handler: MovementHandler

# This is a virtual class, it should not be used directly
func _ready() -> void:
    # Entity should have a MovementHandler
    for c in get_children():
        if c is MovementHandler:
            movement_handler = c

    if movement_handler == null:
        assert(false, "Entity should have a MovementHandler")
