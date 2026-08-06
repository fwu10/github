extends Node2D

var required_ingredients: Dictionary = {}
var placed_ingredients: Dictionary = {}
var all_ingredients_types:= ["tomato", "lettuce","chedder","american","pickles","onions","jalapeno","olives","steak","chicken","tuna","meatballs","capcicum"]
var all_sauce_types:= ["ketchup","mayo","aioli","sweet_sour","hot_sauce","mint_sauce"]
@onready var required_ingredient_box = $Control/Panel/VBoxContainer/RichTextLabel
var order = ""
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_generate_order()
	_generate_sauce()
	required_ingredient_box.text = order
func _generate_order() -> void:
	var num_ingredients = 5
	for i in num_ingredients:
		var type = all_ingredients_types[randi() % all_ingredients_types.size()]
		order += type + ","

func _generate_sauce() -> void:
	var num_ingredients = 2
	for i in num_ingredients:
		var type = all_sauce_types[randi() % all_sauce_types.size()]
		order += type +","

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
