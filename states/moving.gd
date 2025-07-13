class_name Moving
extends State

func physics_update(delta: float) -> void:
    var direction_x: float = movement_handler.get_movement_direction().x
    var velocity_x: float

    # Move the actor
    if direction_x == 0:
        velocity_x = move_toward(actor.velocity.x, 0, actor.speed)
    else:
        velocity_x = direction_x * actor.speed

    # If the actor stopped moving, transition to the idle state
    if velocity_x == 0:
        emit_signal("transition_to", self, "Idle")
    
    # Apply the velocity
    actor.velocity.x = velocity_x
