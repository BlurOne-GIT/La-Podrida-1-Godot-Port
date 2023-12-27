extends Panel

@onready var config_panel = %"Config Panel"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_exit_button_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_config_button_pressed():
	visible = false
	config_panel.visible = true
	config_panel.set_process(true)
	set_process(false)
	pass # Replace with function body.
