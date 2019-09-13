extends Node

const TRANS = Tween.TRANS_SINE
const EASE = Tween.EASE_IN_OUT

var amplitude = 25

onready var camera = get_parent()

func shake(): # Enhance if got the time
	_new_shake()
	
	$Frequency.start()
	$Duration.start()

func _new_shake():
	var rand = Vector2()
	rand.x = rand_range(-amplitude, amplitude)
	rand.y = rand_range(-amplitude, amplitude)
	
	#print("Shake")
	
	$Tween.interpolate_property(camera, "offset", camera.offset, rand, 0.08, TRANS, EASE)
	$Tween.start()
	
	#$Tween.interpolate_property(camera, "offset", camera.offset, Vector2(), 0.5, TRANS, EASE)
	#$Tween.start()
func reset():
	$Tween.interpolate_property(camera, "offset", camera.offset, Vector2(), 0.5, TRANS, EASE)
	$Tween.start()

func _on_Frequency_timeout():
	_new_shake()
	pass # Replace with function body.


func _on_Duration_timeout():
	reset()
	$Frequency.stop()
	pass # Replace with function body.
