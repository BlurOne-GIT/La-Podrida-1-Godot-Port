extends LineEdit

var default_skew: float 
var font_variation: FontVariation
@onready var tecla_sfx = %TeclaSfx

# Called when the node enters the scene tree for the first time.
func _ready():
	font_variation = get_theme_font("font") as FontVariation
	default_skew = font_variation.variation_transform.x.y
	pass # Replace with function body.


func _on_text_changed(new_text):
	tecla_sfx.play(.1)
	font_variation.variation_transform.x.y = .0 if new_text != "" else default_skew
	pass # Replace with function body.
