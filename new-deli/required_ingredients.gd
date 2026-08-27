extends Node2D

var required_ingredients: Dictionary = {}
var placed_ingredients: Dictionary = {}
var order_ui: Dictionary = {} 
var all_ingredients_types:= ["Tomato", "Lettuce","Cheddar","American","Pickles","Onions","Jalapeno","Olives","Steak","Chicken","Tuna","Meatballs","Capcicum","Edam"]
var all_sauce_types:= ["Ketchup","Mayo","Aioli","Mustard","Hot_Sauce","Relish"]

@onready var vbox = $Control/Panel/ScrollContainer/VBoxContainer
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
		
		if not order_ui.has(type):
			order_ui[type] = []
		order_ui[type].append(item)
		
func _generate_sauce() -> void:
	var num_ingredients = 2
	for i in num_ingredients:
		var type = all_sauce_types[randi() % all_sauce_types.size()]
		required_ingredients[type] = required_ingredients.get(type, 0) + 1
		var item = order_item_scene.instantiate()
		vbox.add_child(item)
		item.setup(type)
		
		if not order_ui.has(type):
			order_ui[type] = []
		order_ui[type].append(item)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func mark_placed(type: String) -> void:
	if not order_ui.has(type):
		return
	var count = placed_ingredients.get(type, 0)
	if count < order_ui[type].size():
		order_ui[type][count].mark_complete()
		placed_ingredients[type] = count + 1
		complete_order_board()
		
func mark_unplaced(type: String) -> void:
	if not order_ui.has(type):
		return
	var count = placed_ingredients.get(type, 0)
	if count > 0:
		order_ui[type][count - 1].mark_incomplete()
		placed_ingredients[type] = count - 1
		complete_order_board()
			
func complete_order_board() -> void:
	for type in required_ingredients:
		if placed_ingredients.get(type, 0) < required_ingredients[type]:
			return
	print("order complete")
	reset_order_board()

func reset_order_board() -> void:
	for child in vbox.get_children():
		child.queue_free()
	#sandwich.clear()
	required_ingredients.clear()
	placed_ingredients.clear()
	order_ui.clear()
	_generate_order()
	_generate_sauce()
	
