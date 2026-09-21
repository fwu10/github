extends Control
@onready var done_button = get_tree().get_first_node_in_group("main")
signal clear_sandwich
signal rating_update
var wrong_ingredient_placed = 0
var rating = 2.5
var correct_streak = 0
var wrong_streak = 0


func _ready() -> void:
	done_button.done_pressed.connect(_done_pressed)
	_generate_order()



var required_ingredients: Dictionary = {}
var order_ui: Dictionary = {}
var placed_ingredients: Dictionary = {}
@onready var vbox = $Panel/VBoxContainer
var order_item_scene = preload("res://order_item.tscn")

var protein_types := ["Steak", "Chicken", "Tuna", "Meatballs"]
var cheese_types := ["Cheddar", "American", "Edam"]
var veggie_types := ["Tomato", "Lettuce", "Pickles", "Onions", "Jalapeno", "Olives", "Capcicum"]
var veggie_types_second := ["Tomato", "Lettuce", "Pickles", "Onions", "Jalapeno", "Olives", "Capcicum"]
var sauce_types := ["Ketchup", "Mayo", "Aioli", "Mustard", "Hot_Sauce", "Relish"]

func _add_ingredient(type: String) -> void:
	required_ingredients[type] = required_ingredients.get(type, 0) + 1
	var item = order_item_scene.instantiate()
	vbox.add_child(item)
	item.setup(type)
	if not order_ui.has(type):
		order_ui[type] = []
	order_ui[type].append(item)

func _generate_order() -> void:
	_add_ingredient(protein_types.pick_random())
	_add_ingredient(cheese_types.pick_random())
	_add_ingredient(veggie_types.pick_random())
	_add_ingredient(veggie_types_second.pick_random())
	_add_ingredient(sauce_types.pick_random())
	
func mark_placed(type: String) -> void:
	if not order_ui.has(type):
		wrong_ingredient_placed += 1
		return
	var count = placed_ingredients.get(type, 0)
	if count < order_ui[type].size():
		order_ui[type][count].mark_complete()
		placed_ingredients[type] = count + 1

func mark_unplaced(type: String) -> void:
	if not order_ui.has(type):
		wrong_ingredient_placed -= 1
		return
	var count = placed_ingredients.get(type, 0)
	if count > 0:
		order_ui[type][count - 1].mark_incomplete()
		placed_ingredients[type] = count - 1
		
func _done_pressed() -> void:
	if wrong_ingredient_placed > 0:
		_order_wrong()
		reset_order_board()
		clear_sandwich.emit()
		return
	for type in required_ingredients:
		if placed_ingredients.get(type, 0) < required_ingredients[type]:
			_order_wrong()
			reset_order_board()
			clear_sandwich.emit()
			return
	_order_correct()
	reset_order_board()
	clear_sandwich.emit()

func reset_order_board() -> void:
	for child in vbox.get_children():
		child.queue_free()
	required_ingredients.clear()
	placed_ingredients.clear()
	order_ui.clear()
	_generate_order()

func _order_correct() -> void:
	correct_streak += 1
	wrong_streak = 0
	if correct_streak >= 3:
		rating = min(rating + 0.5, 5.0)
		correct_streak = 0
		rating_update.emit(rating)

func _order_wrong() -> void:
	wrong_streak += 1
	correct_streak = 0
	if wrong_streak >= 2:
		rating = max(rating - 0.5, 0.0)
		wrong_streak = 0
		rating_update.emit(rating)
