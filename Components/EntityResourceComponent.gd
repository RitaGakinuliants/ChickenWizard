extends Node2D
class_name EntityResource

signal value_increased
signal value_decreased
signal value_zero

@export var max_value = 3
@export var initial_value = 3
var _current_value : int

func _ready():
	if initial_value > 0:
		_current_value = initial_value
	else:
		initial_value = max_value
		_current_value = initial_value

func get_current_value():
	return _current_value

func decrease_value(amount : int):
	if _current_value > 0 and amount > 0:
		_current_value = max((_current_value - amount), 0)
		value_decreased.emit(_current_value)
	else:
		return false
	
func get_clamp_to_max(clamp_to_max : bool):
	clamp_to_max = true
	
	if _current_value < max_value and clamp_to_max:
		return
	
func increase_value(value : int, amount: int, clamp_to_max : bool):
	if amount > 0 and get_clamp_to_max(clamp_to_max):
		match clamp_to_max:
			true:
				value = min((_current_value + amount), max_value)
			false:
				value = _current_value + amount
		
	_current_value = value
