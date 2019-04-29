extends Node

signal put_status
signal idle_status

onready var map := get_node("../Map")
export (int) var buy_cost = -1

enum {IDLE, PUT}

var status := IDLE
var selected_unit: Unit

const MIN_Y = 4

func _ready():
    set_status(IDLE)

func _input(event: InputEvent):
    match status:
        PUT:
            if event is InputEventMouseMotion:
                print(event.position)
                var coord = selected_unit.grid_position(event.position)
                if coord.y > MIN_Y:
                    map.preview_unit(selected_unit, coord)
            elif event is InputEventMouseButton:
                var coord = selected_unit.grid_position(event.position)
                if coord.y > MIN_Y && map.is_free(selected_unit, coord):
                    map.create_ally(selected_unit, coord)
                    map.remove_preview()
                    set_status(IDLE)

func _on_Cards_selected(unit):
    selected_unit = unit.instance()
    $Cookie.update_hp(buy_cost)
    set_status(PUT)

func set_status(_status):
    status = _status
    match _status:
        PUT:
            emit_signal("put_status")
        IDLE:
            emit_signal("idle_status")

func _on_Game_fight_stage():
    match status:
        PUT:
            map.remove_preview()
            $Cookie.update_hp(-buy_cost)
            set_status(IDLE)
