extends Node

@onready var health_container = $HUD/HealthContainer

@export var bug_scene: PackedScene
var score

func _ready():
	score = 0
	
	var local_hp : int = $Player/HealthComponent._current_value
	$HUD.setMaxLife(local_hp)
	
func _process(delta):
	score_update()

func score_update():
	score = $Player.score
	$HUD.update_score(score)

func bug_spawn(bush : Node2D):
	var bug = bug_scene.instantiate()
	
	var bug_spawn_location = bush.get_node("BugPath/BugSpawnLocation")
	bug_spawn_location.progress_ratio = randf()
	
	var direction = bug_spawn_location.rotation + PI / 2
	
	bug.position = bug_spawn_location.position + bush.position
	
	direction += randf_range(-PI / 4, PI / 4)
	bug.rotation = direction
	
	var velocity = Vector2(randf_range(100.0, 550.0), 0.0)
	bug.linear_velocity = velocity.rotated(direction)
	
	add_child(bug)

func _on_bug_spawn_bush_spawn():
	bug_spawn($BugSpawnBush)

func _on_bug_spawn_bush_2_spawn():
	bug_spawn($BugSpawnBush2)

func _on_bug_spawn_bush_3_spawn():
	bug_spawn($BugSpawnBush3)
	
	
func enemy_spawn():
	pass
