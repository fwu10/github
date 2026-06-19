extends Node2D
var dragging := false 
var mouse_offset := Vector2.ZERO
var mouse_inside = false
var on_sandwich := false
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
			mouse_offset = global_position - get_global_mouse_position()
			dragging = true 
		else:
			dragging = false
			_ingredients_moving()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("sandwich"):
		on_sandwich = true


func _ingredients_moving() -> void:
	if on_sandwich:
		print("test")
	else:
		queue_free()


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("sandwich"):
		on_sandwich = false
