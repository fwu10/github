extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		var ingredients = load("res://node_2d.tscn")
		var mov_ingredients = ingredients.instantiate()
		get_parent().add_child(mov_ingredients)
		mov_ingredients.global_position = $Area2D/CollisionShape2D.global_position
