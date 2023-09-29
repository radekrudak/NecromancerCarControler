
extends Node

@onready var UDP_yeeter = $UDPYeeter

var flip_throtle = true
var flip_steering_wheel = false

var throtle:float = 0.0
var steering:float = 0.0

var head_light_on = false
var back_light_on = false

func _ready():
	pass
func _process(delta):

	throtle = 0.0
	steering = 0.0
	throtle = Input.get_action_strength("forward") - Input.get_action_strength("backward")
	steering = Input.get_action_strength("turn_left") - Input.get_action_strength("turn_right")
	if Input.is_action_just_pressed("head_light"):
		head_light_on = not head_light_on
	if  Input.is_action_just_pressed("back_light"):
		back_light_on = not back_light_on 
	UDP_yeeter.yeet_control_data(throtle*255, steering*255, head_light_on, back_light_on )
