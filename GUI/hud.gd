extends CanvasLayer

@onready var LifeGuiClass = preload("res://GUI/life_icon.tscn")

func update_score(score):
	$ScoreLabel.text = str(score)

func setMaxLife(max : int):
	for i in range(max):
		var life = LifeGuiClass.instantiate()
		$HealthContainer.add_child(life)

func _on_health_component_value_decreased():
	pass
