extends HBoxContainer
@onready var icon = $TextureRect
@onready var label = $Label
@export var sprite_frames: SpriteFrames

var ingredient_type: String
var is_completed: bool = false

func setup(type: String) -> void:
	ingredient_type = type
	label.text = type 
	icon.texture = sprite_frames.get_frame_texture(type, 0)

func mark_complete() -> void:
	if is_completed:
		return
	is_completed = true
	label.add_theme_color_override("font_color", Color.GREEN)
