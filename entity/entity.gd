class_name Entity
extends CharacterBody2D

@export
var speed: float = 100.0

# This is an abstract class, it should not be used directly
func _ready() -> void:
    assert(false, "This is an abstract class, it should not be used directly or devs forgot to extend it")
