extends Button

@onready var main_panel = %"Main Panel"
@onready var settings_panel = %"Settings Panel"
@onready var bg = %BG

@onready var boton_sfx = %BotonSfx


func _on_pressed():
	settings_panel.process_mode = Node.PROCESS_MODE_DISABLED
	settings_panel.visible = false
	main_panel.visible = true
	main_panel.process_mode = Node.PROCESS_MODE_INHERIT
	boton_sfx.play()
	bg._save()
