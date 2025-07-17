class_name StateMachine

extends Node

@export
var initial_state: State
var current_state: State
var previous_state: State

var _states: Dictionary = {}

func _ready() -> void:
    print("Intial state: %s" % initial_state)
    if initial_state == null:
        assert(false, "Initial state is null")


    # Loop through all the states in the tree
    var actor: Entity = get_parent()
    for child in get_children():
        if child is State:
            _states[child.name] = child

            child.actor = actor
            child.transition_to.connect(child_transition_to)
    
    # Debug print of all states
    for state in _states:
        print("%s: %s" % [state, _states[state]])
    
    # Set the initial state
    current_state = initial_state
    current_state.enter(null)

func child_transition_to(state: State, next_state_name: String) -> void:
    if current_state != state:
        return
    
    var next_state: State = _states[next_state_name]
    if next_state == null:
        assert(false, "Invalid state name: %s" % next_state_name)
        return
    
    change_state(next_state)


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
