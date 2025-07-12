class_name StateMachine

extends Node

@export
var initial_state: State
var current_state: State
var previous_state: State

var _states: Dictionary = {}

func _ready() -> void:
    print("Intial state: %s" % initial_state)

    # Loop through all the states in the tree
    for child in get_children():
        if child is State:
            _states[child.name] = child

            child.actor = get_parent()
            # child.movement_handler
            # child. # signal transition?
    
    # Debug print of all states
    for state in _states:
        print("%s: %s" % [state, _states[state]])
    
    # Set the initial state
    current_state = initial_state
    current_state.enter(null)


func change_state(state: State) -> void:
    # Exit the current state
    if current_state != null:
        previous_state = current_state
        previous_state.exit()
    
    # Enter the new state
    current_state = state
    current_state.enter(previous_state)

func _process(delta: float) -> void:
    if current_state == null:
        return
    current_state.process_update(delta)

func _physics_process(delta: float) -> void:
    if current_state == null:
        return
    current_state.physics_update(delta)