extends CanvasLayer

export (String, MULTILINE) var text: String

func _ready():
    $UIText.text = text
