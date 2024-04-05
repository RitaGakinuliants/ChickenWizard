extends CharacterBody2D
class_name PlayerCharacter

@export var speed : float = 1000.0
var score = 0

func _ready():
	pass

func _physics_process(_delta):
# Move in 4 directions
	var direction = Input.get_vector("move_left", "move_right","move_up", "move_down").normalized()
	if direction:
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO
		
	$AnimatedSprite2D.animation = "breathing_front"
	$AnimatedSprite2D.play()

	move_and_slide()

func player():
	pass


func _on_player_hitbox_body_entered(body):
		if body.has_method("prey"):
			body.queue_free()
			score += 1
		
