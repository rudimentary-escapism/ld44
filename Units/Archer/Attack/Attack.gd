extends Node2D

func _ready():
    z_index = 11
    $AnimatedSprite.play()


func _on_AnimatedSprite_animation_finished():
    queue_free()
