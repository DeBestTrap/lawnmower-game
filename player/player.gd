class_name Player
extends Entity

func _ready() -> void:
    pass

func _physics_process(delta: float) -> void:

    # Add the gravity.
    velocity += get_gravity() * delta
    move_and_slide()
