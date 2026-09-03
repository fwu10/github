extends Node2D
var dragging := false 
var mouse_offset := Vector2.ZERO
var mouse_inside = false
var on_sandwich := false
@export var ingredient_type: String
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	animated_sprite.play(ingredient_type)
	var board = get_tree().get_first_node_in_group("order_board")
	if board:
		board.kill_all_moving_ingredients.connect(_kill_moving_ingredients)
func _kill_moving_ingredients() -> void:
	queue_free()
	
func _process(delta: float) -> void:
	if dragging:
		global_position = get_global_mouse_position() + mouse_offset
func _on_area_2d_mouse_entered() -> void:
	mouse_inside = true
func _on_area_2d_mouse_exited() -> void:
	mouse_inside = false


func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed and mouse_inside:
			if not dragging:
				mouse_offset = global_position - get_global_mouse_position()
				dragging = true 
		else:
			dragging = false
			_ingredients_moving()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("sandwich"):
		on_sandwich = true
		add_to_group("on_sandwich")


func _ingredients_moving() -> void:
	if on_sandwich:
		print("ingredients-onsandwich")
		
		
	else:
		print("deleting")
		queue_free()
		


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("sandwich"):
		on_sandwich = false
		remove_from_group("on_sandwich")
		var board = get_tree().get_first_node_in_group("order_board")
		if board:
			board.mark_unplaced(ingredient_type)
		
