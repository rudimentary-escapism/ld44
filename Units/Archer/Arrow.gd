extends Node2D

var target: Unit
var damage := 1
var speed = 300

func _ready():
    pass

func _process(delta: float):
    if is_instance_valid(target):
        position += position.direction_to(target.position) * speed * delta
        if position.distance_to(target.position) < 10:
            target.take_damage(damage)
            queue_free()
    else:
        queue_free()