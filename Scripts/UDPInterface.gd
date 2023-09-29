extends Node

const PORT = 6969
const IP_TO_YEET_TO = "192.168.1.2"

var packetYeeterAndCatcher: PacketPeerUDP = PacketPeerUDP.new()

#  3 bytes
#  first byyte holds throtle value 
#  second bytes wheel drive 
#  third holds flags (7 most significant bit- 0 significant bit least): 
#  7 - is throtole negative ( 1 - yes, 0 - no)
#  6 - is steering whleel negative ( 1- yes, 0 - no)
#
#  1 - is head light on
#  0 - is back light on

func yeet_control_data(throtle:int, steering_wheel:int, head_light:bool, back_light:bool):
	var is_throte_negative = (throtle < 0 )
	var is_steering_wheel_negative = (steering_wheel < 0)	
	var flags = 0
	if is_throte_negative:
		flags += pow(2, 7) 
		throtle *= -1

	if is_steering_wheel_negative:
		flags += pow(2, 6)
		steering_wheel *= -1
		
	if head_light:
		flags += 2
		
	if back_light:
		flags += 1
	
	var outBuffer = PackedByteArray()
	outBuffer.resize(3)
	outBuffer.encode_u8(0, throtle & 0xff)
	outBuffer.encode_u8(1, steering_wheel & 0xff)
	outBuffer.encode_u8(2, flags) 
	packetYeeterAndCatcher.put_packet(outBuffer)

# Called when the node enters the scene tree for the first time.
func _ready():
	packetYeeterAndCatcher.connect_to_host(IP_TO_YEET_TO,PORT)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
