extends Node

@export
var tree_tab : ScrollContainer
@export
var nutrient_tab : ScrollContainer
@export
var water_tab : ScrollContainer
@export
var sun_tab : ScrollContainer

var tabs
var actual_tab : ScrollContainer

# Called when the node enters the scene tree for the first time.
func _ready():
	tabs = [tree_tab, nutrient_tab, water_tab, sun_tab]
	for i in range(1, tabs.size()):
		tabs[i].visible = false
	tree_tab.visible = true
	actual_tab = tree_tab


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func toggle_buton(new_tab : ScrollContainer):
	if(actual_tab != new_tab):
		actual_tab.visible = false
		actual_tab = new_tab
		actual_tab.visible = true

func _on_tree_tab_pressed():
	toggle_buton(tree_tab)


func _on_nutrient_tab_pressed():
	toggle_buton(nutrient_tab)


func _on_water_tab_pressed():
	toggle_buton(water_tab)


func _on_sun_tab_pressed():
	toggle_buton(sun_tab)
