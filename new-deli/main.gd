extends Node2D
signal done_pressed
var sandwich_ingredients = []
@onready var rating_update = get_tree().get_first_node_in_group("order_board")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rating_update.rating_changed.connect(_on_rating_changed)

func _on_rating_changed(new_rating) -> void:
	print(new_rating)
	

func show_bench(bench_index: int) -> void:
	$Bench1.visible = (bench_index == 1)
	$Bench2.visible = (bench_index == 2)


func _on_texture_button_pressed() -> void:
	done_pressed.emit()
	
