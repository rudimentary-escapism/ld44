extends Node

onready var map := get_node("../Map")

enum {IDLE, PUT}

var warrior := preload("res://Units/Warrior.tscn")
var status := IDLE
var current: Unit

func _ready():
    current = warrior.instance()
    status = PUT

func _input(event: InputEvent):
    match status:
        PUT:
            if event is InputEventMouseMotion:
                var coord = current.grip_position(event.position)
                map.preview_unit(warrior, coord)
            elif event is InputEventMouseButton:
                var coord = current.grip_position(event.position)
                map.create_ally(current, coord)
                map.remove_preview()
                status = IDLE