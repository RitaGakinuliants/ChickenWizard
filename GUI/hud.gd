extends CanvasLayer

@onready var LifeGuiClass = preload("res://GUI/life_icon.tscn")
var life_array = []

func update_score(score):
	$ScoreLabel.text = str(score)

func setMaxLife(max_value : int):
	for i in range(max_value):
		var life = LifeGuiClass.instantiate()
		$HealthContainer.add_child(life)
		life_array.append(life)

func _on_health_component_value_decreased():
	var max_index: int = life_array.size() - 1
	life_array[max_index].queue_free()
	life_array.remove_at(max_index)
