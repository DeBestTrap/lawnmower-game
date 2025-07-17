class_name Falling
extends State

func physics_update(delta: float) -> void:
    # If the actor has landed on the floor then transition to the grounded state
    if actor.is_on_floor():
        emit_signal("transition_to", self, "Grounded")

    # When the actor is falling, add additional velocity
    actor.velocity += actor.falling_multiplier * actor.get_gravity() * delta
