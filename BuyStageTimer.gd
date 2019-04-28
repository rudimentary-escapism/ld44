extends Control

signal timeout

func _ready():
    pass

func _process(delta: float):
    var time = str(ceil($Timer.time_left))
    if time.length() == 1:
        time = "0" + str(time)
    $Label.text = "0:" + str(time)

func _on_Game_buy_stage():
    $Timer.start()
    $Label.visible = true


func _on_Timer_timeout():
    $Label.visible = false
    emit_signal("timeout")
