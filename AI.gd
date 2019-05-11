extends Node

signal lost

onready var Cards := get_node("/root/Cards")

var _round = 0

func _ready():
    pass


func _on_Game_fight_stage():
    _round += 1
    match _round:
        1:
            get_node("../Map").create_enemy(
                Cards.get_priest(), Vector2(4, 0)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(2, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(7, 4)
            )
        2:
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(1, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_paladin(), Vector2(4, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_paladin(), Vector2(5, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(8, 4)
            )
            create_mage(4, 1)
            get_node("../Map").create_enemy(
                Cards.get_priest(), Vector2(5, 1)
            )
        3:
            get_node("../Map").create_enemy(
                Cards.get_rogue(), Vector2(0, 1)
            )
            get_node("../Map").create_enemy(
                Cards.get_priest(), Vector2(3, 1)
            )
            get_node("../Map").create_enemy(
                Cards.get_archer(), Vector2(4, 1)
            )
            create_mage(4, 0)
            get_node("../Map").create_enemy(
                Cards.get_archer(), Vector2(5, 1)
            )
            create_mage(5, 0)
            get_node("../Map").create_enemy(
                Cards.get_priest(), Vector2(5, 0)
            )
            get_node("../Map").create_enemy(
                Cards.get_rogue(), Vector2(9, 1)
            )
        4:
            get_node("../Map").create_enemy(
                Cards.get_rogue(), Vector2(0, 1)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(1, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_priest(), Vector2(3, 0)
            )
            get_node("../Map").create_enemy(
                Cards.get_paladin(), Vector2(4, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_archer(), Vector2(4, 1)
            )
            get_node("../Map").create_enemy(
                Cards.get_paladin(), Vector2(5, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_archer(), Vector2(5, 1)
            )
            get_node("../Map").create_enemy(
                Cards.get_priest(), Vector2(6, 0)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(8, 4)
            )
            create_mage(9, 1)
        5:
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(0, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_rogue(), Vector2(1, 1)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(3, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(4, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(5, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(6, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_priest(), Vector2(4, 0)
            )
            get_node("../Map").create_enemy(
                Cards.get_priest(), Vector2(5, 0)
            )
            create_mage(4, 1)
            create_mage(5, 1)
            get_node("../Map").create_enemy(
                Cards.get_rogue(), Vector2(8, 2)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(9, 4)
            )
        6:
            get_node("../Map").create_enemy(
                Cards.get_priest(), Vector2(0, 0)
            )
            get_node("../Map").create_enemy(
                Cards.get_priest(), Vector2(9, 0)
            )
            get_node("../Map").create_enemy(
                Cards.get_rogue(), Vector2(0, 3)
            )
            get_node("../Map").create_enemy(
                Cards.get_rogue(), Vector2(9, 3)
            )
            get_node("../Map").create_enemy(
                Cards.get_archer(), Vector2(2, 2)
            )
            get_node("../Map").create_enemy(
                Cards.get_archer(), Vector2(7, 2)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(3, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(4, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(5, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(6, 4)
            )
            create_mage(3, 0)
            create_mage(4, 0)
            create_mage(5, 0)
            create_mage(6, 0)
            create_mage(4, 1)
            create_mage(5, 1)
        7:
            get_node("../Map").create_enemy(
                Cards.get_priest(), Vector2(0, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_priest(), Vector2(9, 4)
            )
            create_mage(4, 0)
            create_mage(5, 0)
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(1, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(2, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(3, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(4, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(5, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(6, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(7, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(8, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_archer(), Vector2(1, 3)
            )
            get_node("../Map").create_enemy(
                Cards.get_archer(), Vector2(2, 3)
            )
            get_node("../Map").create_enemy(
                Cards.get_archer(), Vector2(3, 3)
            )
            get_node("../Map").create_enemy(
                Cards.get_archer(), Vector2(4, 3)
            )
            get_node("../Map").create_enemy(
                Cards.get_archer(), Vector2(5, 3)
            )
            get_node("../Map").create_enemy(
                Cards.get_archer(), Vector2(6, 3)
            )
            get_node("../Map").create_enemy(
                Cards.get_archer(), Vector2(7, 3)
            )
            get_node("../Map").create_enemy(
                Cards.get_archer(), Vector2(8, 0)
            )
        8:
            get_node("../Map").create_enemy(
                Cards.get_priest(), Vector2(0, 0)
            )
            get_node("../Map").create_enemy(
                Cards.get_priest(), Vector2(9, 0)
            )
            create_mage(3, 0)
            create_mage(4, 0)
            create_mage(5, 0)
            create_mage(6, 0)
            get_node("../Map").create_enemy(
                Cards.get_archer(), Vector2(0, 3)
            )
            get_node("../Map").create_enemy(
                Cards.get_archer(), Vector2(9, 3)
            )
            get_node("../Map").create_enemy(
                Cards.get_rogue(), Vector2(0, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_rogue(), Vector2(9, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_paladin(), Vector2(1, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_paladin(), Vector2(8, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(2, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(3, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(4, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(5, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(6, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(7, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_archer(), Vector2(3, 3)
            )
            get_node("../Map").create_enemy(
                Cards.get_archer(), Vector2(4, 3)
            )
            get_node("../Map").create_enemy(
                Cards.get_archer(), Vector2(5, 3)
            )
            get_node("../Map").create_enemy(
                Cards.get_archer(), Vector2(6, 3)
            )
        9:
            get_node("../Map").create_enemy(
                Cards.get_rogue(), Vector2(0, 3)
            )
            get_node("../Map").create_enemy(
                Cards.get_rogue(), Vector2(1, 3)
            )
            get_node("../Map").create_enemy(
                Cards.get_rogue(), Vector2(8, 3)
            )
            get_node("../Map").create_enemy(
                Cards.get_rogue(), Vector2(9, 3)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(3, 0)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(4, 0)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(5, 0)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(6, 0)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(6, 1)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(6, 2)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(6, 3)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(6, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(5, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(4, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(3, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(3, 3)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(3, 2)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(3, 1)
            )
            get_node("../Map").create_enemy(
                Cards.get_paladin(), Vector2(7, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_priest(), Vector2(4, 1)
            )
            get_node("../Map").create_enemy(
                Cards.get_priest(), Vector2(5, 1)
            )
            create_mage(4, 2)
            create_mage(5, 2)
            get_node("../Map").create_enemy(
                Cards.get_archer(), Vector2(4, 3)
            )
            get_node("../Map").create_enemy(
                Cards.get_archer(), Vector2(5, 3)
            )
        10:
            get_node("../Map").create_enemy(
                Cards.get_priest(), Vector2(0, 0)
            )
            get_node("../Map").create_enemy(
                Cards.get_priest(), Vector2(9, 0)
            )
            get_node("../Map").create_enemy(
                Cards.get_rogue(), Vector2(0, 1)
            )
            get_node("../Map").create_enemy(
                Cards.get_rogue(), Vector2(9, 1)
            )
            get_node("../Map").create_enemy(
                Cards.get_paladin(), Vector2(2, 1)
            )
            get_node("../Map").create_enemy(
                Cards.get_paladin(), Vector2(3, 2)
            )
            get_node("../Map").create_enemy(
                Cards.get_paladin(), Vector2(8, 1)
            )
            get_node("../Map").create_enemy(
                Cards.get_paladin(), Vector2(7, 2)
            )
            get_node("../Map").create_enemy(
                Cards.get_priest(), Vector2(2, 0)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(3, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(4, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(5, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_warrior(), Vector2(6, 4)
            )
            get_node("../Map").create_enemy(
                Cards.get_archer(), Vector2(3, 3)
            )
            get_node("../Map").create_enemy(
                Cards.get_archer(), Vector2(4, 3)
            )
            get_node("../Map").create_enemy(
                Cards.get_archer(), Vector2(5, 3)
            )
            get_node("../Map").create_enemy(
                Cards.get_archer(), Vector2(6, 3)
            )
            get_node("../Map").create_enemy(
                Cards.get_archer(), Vector2(4, 2)
            )
            get_node("../Map").create_enemy(
                Cards.get_archer(), Vector2(5, 2)
            )
            create_mage(3, 0)
            create_mage(4, 0)
            create_mage(5, 0)
            create_mage(6, 0)
            create_mage(3, 1)
            create_mage(4, 1)
            create_mage(5, 1)
            create_mage(6, 1)
        11:
            emit_signal("lost")

func create_mage(x: int, y: int):
    var m = Cards.get_mage()
    m._on_Game_fight_stage()
    get_node("../Map").create_enemy(
        m, Vector2(x, y)
    )