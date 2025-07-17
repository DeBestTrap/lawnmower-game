class_name EnemyPlant
extends Entity


func _ready() -> void:
    super._ready()

func _physics_process(delta: float) -> void:
    # Add gravity
    velocity += get_gravity() * delta
    move_and_slide()
    
