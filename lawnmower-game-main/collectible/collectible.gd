class_name Collectible
extends Node2D

# any collectible items, like fuel or something

func onCollect(itemType) -> void:
	if itemType == "fuel":
		GLOBAL.mowerProgress += 34

	queue_free()