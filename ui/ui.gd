extends CanvasLayer

@onready var pauseScreen: ColorRect = $PauseScreen
@onready var pauseButton: Button = $Pause

@onready var progress_bar: ProgressBar = $MowerProgressBar

func _process(_delta: float) -> void:
	if not GLOBAL.mowerMode:
		# Smoothly animate the progress bar value (for adding progress)
		if progress_bar.value < GLOBAL.mowerProgress:
			progress_bar.value += 1.0
		elif progress_bar.value > GLOBAL.mowerProgress:
			progress_bar.value -= 1.0
	elif GLOBAL.mowerMode:
		GLOBAL.mowerProgress -= 0.075 #on activate, decreases mower progress
		progress_bar.value = GLOBAL.mowerProgress

	if progress_bar.value >= 100.0:
		GLOBAL.mowerMode = true
		
	if Input.is_action_just_pressed("CheatMowerProgress"):
		GLOBAL.mowerProgress += 10.0



func _on_unpause_pressed() -> void:
	get_tree().paused = false
	pauseScreen.visible = false
	pauseButton.visible = true

func _on_pause_pressed() -> void:
	get_tree().paused = true
	pauseScreen.visible = true
	pauseButton.visible = false

func _on_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(value))
