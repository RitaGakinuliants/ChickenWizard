extends Node2D

signal spawn

@export var bug_scene: PackedScene

func _ready():
	$BushTimer.start()

func _process(delta):
	pass

func _on_bush_timer_timeout():
	spawn.emit()
