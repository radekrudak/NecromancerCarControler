extends Control

@onready var Controler = $InputSender
@onready var WalkLabel = $WalkLabel
@onready var SteeringLabel = $SteeringLabel
@onready var SteeringBar1 = $Bars/SteeringBars/SteeringBar
@onready var SteeringBar2 = $Bars/SteeringBars/SteeringBar2
@onready var ThrotleBar1 = $Bars/ThrotleBar/ThrotleBar
@onready var ThrotleBar2 = $Bars/ThrotleBar/ThrotleBar2
@onready var LightIndicator = $Bars/LightIndicator
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	SteeringBar1.set_value_no_signal(Controler.steering)
	SteeringBar2.set_value_no_signal(Controler.steering * -1)
	ThrotleBar1.set_value_no_signal(Controler.throtle * -1)
	ThrotleBar2.set_value_no_signal(Controler.throtle)
	var lightsString = ""
	lightsString += "HEAD LIGHT: "
	if Controler.head_light_on:
		lightsString += "ON\n"
	if not Controler.head_light_on:
		lightsString += "OFF\n"

	lightsString += "BACK LIGHT: "
	if Controler.back_light_on:
		lightsString += "ON\n"
	if not Controler.back_light_on:
		lightsString += "OFF\n"

	LightIndicator.set_text(lightsString)
