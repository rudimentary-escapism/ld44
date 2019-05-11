extends Node2D

signal buy_stage
signal fight_stage

enum {INTRO, BUY, FIGHT, AI_WON, PLAYER_WON}

var stage = INTRO;

func _ready():
    pass
    
func set_stage(_stage):
    stage = _stage
    match _stage:
        BUY:
            emit_signal("buy_stage")
        FIGHT:
            emit_signal("fight_stage")
        PLAYER_WON:
            get_node("/root/Game/Interface/Win").scale.y = 1
            get_tree().paused = true
            $Interface/Hand.layer = 0
        AI_WON:
            get_node("/root/Game/Interface/Lose").scale.y = 1
            get_tree().paused = true
            $Interface/Hand.layer = 0


func _on_BuyStageTimer_timeout():
    set_stage(FIGHT)


func _on_Map_ai_lost():
    set_stage(BUY)


func _on_Map_player_lost():
    $Player/Cookie.update_hp(-1)
    set_stage(BUY)


func _on_Intro_ended():
    $Intro.queue_free()
    $Player/Cookie.show()
    set_stage(BUY)


func _on_AI_lost():
    set_stage(PLAYER_WON)


func _on_Cookie_lost():
    set_stage(AI_WON)
