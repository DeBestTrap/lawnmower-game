extends Collectible

# could probably be handled in the collectible class... bleh
func _on_body_entered(_body:Node2D) -> void:
	onCollect("fuel")