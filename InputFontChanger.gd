extends LineEdit

var default_skew: float 
var font_variation: FontVariation


# Called when the node enters the scene tree for the first time.
func _ready():
	font_variation = get_theme_font("font") as FontVariation
	default_skew = font_variation.variation_transform.x.y
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_text_changed(new_text):
	font_variation.variation_transform.x.y = 0 if new_text != "" else default_skew
	pass # Replace with function body.
