extends Node2D

var required_ingredients: Dictionary = {}
var placed_ingredients: Dictionary = {}
var order_ui: Dictionary = {} 
var all_ingredients_types:= ["tomato", "lettuce","chedder","american","pickles","onions","jalapeno","olives","steak","chicken","tuna","meatballs","capcicum","edam"]
var all_sauce_types:= ["ketchup","mayo","aioli","mustard","hot_sauce","relish"]

@onready var vbox = $Control/Panel/VBoxContainer
var order_item_scene = preload("res://order_item.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_generate_order()
	_generate_sauce()
	
func _generate_order() -> void:
	var num_ingredients = 5
	for i in num_ingredients:
		var type = all_ingredients_types[randi() % all_ingredients_types.size()]
		required_ingredients[type] = required_ingredients.get(type, 0) + 1
		var item = order_item_scene.instantiate()
		vbox.add_child(item)
		item.setup(type)
		order_ui[type] = item
func _generate_sauce() -> void:
	var num_ingredients = 2
	for i in num_ingredients:
		var type = all_sauce_types[randi() % all_sauce_types.size()]
		required_ingredients[type] = required_ingredients.get(type, 0) + 1
		var item = order_item_scene.instantiate()
		vbox.add_child(item)
		item.setup(type)
		order_ui[type] = item
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func mark_placed(type: String) -> void:
	if order_ui.has(type):
		order_ui[type].mark_complete()
		
	
