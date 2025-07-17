class_name EnemyPlantMovementHandler
extends MovementHandler

var player: Player

func _ready() -> void:
    super._ready()
    player = get_tree().get_first_node_in_group("player")

func get_movement_direction() -> Vector2:
    if player == null:
        assert(false, "Player not found")
    if parent == null:
        assert(false, "Parent not found")

    # Move towards the player
    var direction = Vector2.ZERO
    # direction.x += 1
    direction.x = (player.global_position - parent.global_position).normalized().x
    return direction
