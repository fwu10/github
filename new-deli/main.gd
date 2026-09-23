extends Node2D
signal done_pressed
var sandwich_ingredients = []
@onready var rating_update = get_tree().get_first_node_in_group("order_board")
@onready var animated_sprite: AnimatedSprite2D = $Bench1/Rating
@onready var done_button: CanvasLayer = $Bench1/CanvasLayer
@onready var menu = $Bench1/Menu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rating_update.rating_changed.connect(_on_rating_changed)
	menu.done_button.connect(_on_menu_done_button)
	animated_sprite.play(str(2.5))
	done_button.hide()
	
func _on_rating_changed(new_rating) -> void:
	print(new_rating)
	animated_sprite.play(str(new_rating))
	

func _on_texture_button_pressed() -> void:
	done_pressed.emit()
	
	
func _on_menu_done_button() -> void:
	done_button.show()
