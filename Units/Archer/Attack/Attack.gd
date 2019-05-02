extends Node2D

var target: Unit
var damage := 1
var speed = 300

var Hit = preload("res://Units/Archer/Hit/Hit.tscn")

func _ready():
    $AnimatedSprite.play()

func _process(delta: float):
    if is_instance_valid(target):
        look_at(target.position)
        position += position.direction_to(target.position) * speed * delta
        if position.distance_to(target.position) < 10:
            play_attack_animation()
            target.take_damage(damage)
            queue_free()
    else:
        queue_free()
        
func play_attack_animation():
    var hit = Hit.instance()
    hit.position = position
    get_node("/root/Game").add_child(hit)