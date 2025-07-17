class_name Jump
extends State

func enter(prev_state: State) -> void: 
    actor.velocity.y = -actor.jump_speed
    super.enter(prev_state)

# Our own update loop so all states in FSM aren't called at the same time
func physics_update(delta: float) -> void:
    emit_signal("transition_to", self, "Jumping")