extends Panel

@onready var config_panel = %"Settings Panel"
@onready var boton_sfx = %BotonSfx


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_exit_button_pressed():
	get_tree().quit()


func _on_config_button_pressed():
	boton_sfx.play()
	process_mode = Node.PROCESS_MODE_DISABLED
	visible = false
	config_panel.visible = true
	config_panel.process_mode = Node.PROCESS_MODE_INHERIT
