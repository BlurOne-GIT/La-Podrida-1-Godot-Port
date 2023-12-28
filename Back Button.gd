extends Button

@onready var main_panel = %"Main Panel"
@onready var settings_panel = %"Settings Panel"
@onready var bg = %BG
@onready var lobby_panel = %"Lobby Panel"
@export var in_lobby = false

@onready var boton_sfx = %BotonSfx


func _on_pressed():
	var other_panel = main_panel if not in_lobby else lobby_panel
	settings_panel.process_mode = Node.PROCESS_MODE_DISABLED
	settings_panel.visible = false
	other_panel.visible = true
	other_panel.process_mode = Node.PROCESS_MODE_INHERIT
	boton_sfx.play()
	bg._save()
