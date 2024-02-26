extends Node2D
@export var rotation_speed : int 
@export var button_press : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _rotate_me():
	transform = transform.rotated_local(rotation_speed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(button_press):
		_rotate_me()
	

func _on_button_button_down():
	button_press = true


func _on_button_button_up():
	button_press = false
	
	
