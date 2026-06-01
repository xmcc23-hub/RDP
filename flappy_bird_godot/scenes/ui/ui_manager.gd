extends CanvasLayer
class_name UIManager

@onready var score_label = $VBoxContainer/ScoreLabel
@onready var high_score_label = $VBoxContainer/HighScoreLabel
@onready var menu_container = $MenuContainer
@onready var game_over_container = $GameOverContainer
@onready var difficulty_menu = $DifficultyMenu
@onready var game_manager = get_parent()

func _ready():
	game_over_container.hide()
	difficulty_menu.hide()
	
	# Connect difficulty buttons
	var easy_btn = menu_container.get_node("VBoxContainer/HBoxContainer/EasyButton")
	var normal_btn = menu_container.get_node("VBoxContainer/HBoxContainer/NormalButton")
	var hard_btn = menu_container.get_node("VBoxContainer/HBoxContainer/HardButton")
	
	easy_btn.pressed.connect(func(): game_manager.set_difficulty(1))
	normal_btn.pressed.connect(func(): game_manager.set_difficulty(2))
	hard_btn.pressed.connect(func(): game_manager.set_difficulty(3))

func update_score(score: int):
	score_label.text = "Score: %d" % score

func update_high_score(high_score: int):
	high_score_label.text = "High Score: %d" % high_score

func update_game_state(state: String):
	match state:
		"menu":
			menu_container.show()
			game_over_container.hide()
			draw_difficulty_menu()
		"playing":
			menu_container.hide()
			game_over_container.hide()
		"game_over":
			game_over_container.show()
			menu_container.hide()

func show_game_over(score: int, high_score: int):
	var game_over_label = game_over_container.get_node("VBoxContainer/GameOverLabel")
	var final_score_label = game_over_container.get_node("VBoxContainer/FinalScoreLabel")
	var final_high_score_label = game_over_container.get_node("VBoxContainer/FinalHighScoreLabel")
	
	game_over_label.text = "GAME OVER!"
	final_score_label.text = "Score: %d" % score
	final_high_score_label.text = "High Score: %d" % high_score

func draw_difficulty_menu():
	difficulty_menu.show()

func hide_difficulty_menu():
	difficulty_menu.hide()