class_name Grounded
extends State

func physics_update(delta: float) -> void:
    if actor.movement_handler.wants_to_jump():
        emit_signal("transition_to", self, "Jump")

    if (!actor.is_on_floor()):
        emit_signal("transition_to", self, "Falling")