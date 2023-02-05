extends Upgrade

func can_buy() -> bool:
	if type == "root" and not upgrade_man.tree.can_add_root():
		return false
	var nutrient_amount = upgrade_man.nutrient_counter.count
	var water_amount = upgrade_man.water_counter.count
	var sun_amount = upgrade_man.sun_counter.count
	if nutrient_amount >= nutrient_cost and water_amount >= water_cost and sun_amount >= sun_cost:
		print("Purchased upgrade " + str(type))
		return true
	else:
		print("Not enough resources")
		return false

func _on_button_pressed() -> void:
	if can_buy():
		take_resources()
		match type:
			"root": upgrade_man.tree.add_root()
			"leaf": upgrade_man.tree.add_leaf()
			"levelup": upgrade_man.tree.upgrade()
