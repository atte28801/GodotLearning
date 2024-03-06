extends State

@export var death_animation : String = "dead"

func on_enter():
	playback.travel(death_animation)
