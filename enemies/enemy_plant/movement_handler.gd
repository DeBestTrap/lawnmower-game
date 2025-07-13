class_name EnemyPlantMovementHandler
extends MovementHandler

func get_movement_direction() -> Vector2:
    var direction = Vector2.ZERO
    direction.x += 1
    return direction
