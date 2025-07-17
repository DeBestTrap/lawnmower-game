class_name Jumping
extends State

func physics_update(delta: float) -> void:
    # If the actor is at the apex of their jump
    #   then transition to falling
    if actor.velocity.y >= 0:
        emit_signal("transition_to", self, "Falling")