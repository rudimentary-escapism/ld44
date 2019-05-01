extends Node2D

var target: Unit
var damage := 1
var speed = 300

var Attack = preload("res://Units/Archer/Attack/Attack.tscn")

func _ready():
    pass

func _process(delta: float):
    if is_instance_valid(target):
        position += position.direction_to(target.position) * speed * delta
        if position.distance_to(target.position) < 10:
            play_attack_animation()
            target.take_damage(damage)
            queue_free()
    else:
        queue_free()
        
func play_attack_animation():
    var attack = Attack.instance()
    attack.position = position
    get_node("/root/Game").add_child(attack)