extends Node2D

const PIPE_WIDTH = 52
const PIPE_HEIGHT = 320

var gap_y = 0
var gap_size = 120
var scored = false

@onready var top_pipe = $TopPipe
@onready var bottom_pipe = $BottomPipe
@onready var score_area = $ScoreArea
@onready var game_manager = get_tree().root.get_child(0).get_node("GameManager")

func _ready():
	score_area.area_entered.connect(_on_score_area_entered)

func setup(p_gap_y: float, p_gap_size: float):
	gap_y = p_gap_y
	gap_size = p_gap_size
	
	# Position top pipe
	top_pipe.position.y = gap_y - gap_size / 2 - PIPE_HEIGHT / 2
	
	# Position bottom pipe
	bottom_pipe.position.y = gap_y + gap_size / 2 + PIPE_HEIGHT / 2

func _on_score_area_entered(area):
	if area.name == "Bird" and not scored:
		scored = true
		game_manager.on_pipe_passed()