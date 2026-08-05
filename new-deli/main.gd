extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func show_bench(bench_index: int) -> void:
	$Bench1.visible = (bench_index == 1)
	$Bench2.visible = (bench_index == 2)

func check_sandwich() -> bool:
	var sandwich_ingredient 
