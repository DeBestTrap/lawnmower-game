extends Node

#contains all global variables, to be used across separate scripts

var mowerMode = false:
	set (value):
		mowerMode = value
		print(mowerMode)
		if mowerMode:
			mowerModeActivate.emit()
		else:
			mowerModeDeactivate.emit()

var mowerProgress : float = 0.0:
	set(value):
		mowerProgress = value

		if mowerProgress >= 100.0:
			mowerProgress = 100.0
			# mowerMode = true #gets changed in ui instead, to match with progress bar
		elif mowerProgress < 0.0:
			mowerProgress = 0.0
			mowerMode = false

signal mowerModeActivate #ready to mow !!!
signal mowerModeDeactivate #mower is off