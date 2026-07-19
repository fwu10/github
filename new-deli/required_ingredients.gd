extends Node2D

var required_ingredients: Dictionary = {}
var placed_ingredients: Dictionary = {}
var all_ingredients_types:= ["tomato", "lettuce"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_generate_order()

func _generate_order() -> void:
	var num_ingredients = 5
	for i in num_ingredients:
		var type = all_ingredients_types[randi() % all_ingredients_types.size()]
		print(type)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
