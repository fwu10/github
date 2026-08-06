extends Node2D
var sandwich_ingredients = []
var required_ingredients = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func show_bench(bench_index: int) -> void:
	$Bench1.visible = (bench_index == 1)
	$Bench2.visible = (bench_index == 2)
