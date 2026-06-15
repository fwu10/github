extends Node2D

var dragging := false 
var mouse_offset := Vector2.ZERO
var mouse_inside = false
func _process(delta: float) -> void:
	if dragging:
		position = get_global_mouse_position() + mouse_offset


func _on_area_2d_mouse_entered() -> void:
	mouse_inside = true
	


func _on_area_2d_mouse_exited() -> void:
	mouse_inside = false


func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed and mouse_inside:
			mouse_offset = position - get_global_mouse_position()
			dragging = true 
		else:
			dragging = false
