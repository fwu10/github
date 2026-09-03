extends Node2D
@export var order_board: Node
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
		var draggable = area.get_parent() 
		draggable.global_position.y = global_position.y
		draggable.dragging = false
		var board = get_tree().get_first_node_in_group("order_board")
		if board:
			board.mark_placed(draggable.ingredient_type)
			
 
