extends Panel

@onready var boton_sfx = %BotonSfx
@onready var main_panel = %"Main Panel"
@onready var back_button = %"Back Button"
@onready var devil_panel = %"Devil Panel"
@onready var bg = %BG

func _on_start_button_pressed():
	boton_sfx.play()
	bg.process_mode = Node.PROCESS_MODE_DISABLED
	bg.visible = false
	devil_panel.visible = true
	devil_panel.process_mode = Node.PROCESS_MODE_INHERIT
	pass # Replace with function body.


func _on_leave_button_pressed():
	boton_sfx.play()
	back_button.in_lobby = false
	process_mode = Node.PROCESS_MODE_DISABLED
	visible = false
	main_panel.visible = true
	main_panel.process_mode = Node.PROCESS_MODE_INHERIT
