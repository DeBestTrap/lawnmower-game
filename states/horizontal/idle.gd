class_name Idle
extends State

func physics_update(delta: float) -> void:
    if actor.movement_handler.get_movement_direction().x != 0:
        emit_signal("transition_to", self, "Moving")
