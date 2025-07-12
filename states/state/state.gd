class_name State
extends Node

# This is a virtual class, it should not be used directly
var actor: Entity
# var movement_handler: MovementHandler
var previous_state: State

func enter(prev_state: State) -> void: 
    previous_state = prev_state

func exit() -> void:
    pass

# Our own update loop so all states in FSM aren't called at the same time
func process_update(delta: float) -> void:
    pass

# Our own update loop so all states in FSM aren't called at the same time
func physics_update(delta: float) -> void:
    pass