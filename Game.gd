extends Node2D

signal buy_stage
signal fight_stage

enum {BUY, FIGHT}

var stage;

func _ready():
    set_stage(BUY)
    
func set_stage(_stage):
    match _stage:
        BUY:
            stage = _stage
            emit_signal("buy_stage")
        FIGHT:
            stage = _stage
            emit_signal("fight_stage")


func _on_BuyStageTimer_timeout():
    set_stage(FIGHT)


func _on_Map_ai_lost():
    set_stage(BUY)


func _on_Map_player_lost():
    $Player/Cookie.update_hp(-1)
    set_stage(BUY)
