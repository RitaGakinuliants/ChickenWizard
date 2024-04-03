extends CharacterBody2D
class_name Enemy
@export var speed : float = 500.0
@export var damage_amount = 1
@onready var player = get_node("../Player")

func _physics_process(delta):
	velocity = Vector2.ZERO
	velocity = position.direction_to(player.position) * speed
	
	move_and_slide()
	
func enemy():
	pass

func _on_enemy_hitbox_body_entered(body):
	if body == player:
		var local_hp_component = get_node("../Player/HealthComponent")
		local_hp_component.decrease_value(damage_amount)
		print(local_hp_component._current_value)
