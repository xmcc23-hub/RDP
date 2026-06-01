extends Node
class_name GameManager

# Game states
var game_state = "menu"  # menu, playing, game_over
var score = 0
var high_score = 0
var difficulty = 1  # 1: Easy, 2: Normal, 3: Hard

# References
@onready var bird = $Bird
@onready var pipe_spawner = $PipeSpawner
@onready var ui_manager = $UIManager
@onready var audio_manager = $AudioManager

func _ready():
	load_high_score()
	set_game_state("menu")

func _process(_delta):
	if game_state == "playing" and Input.is_action_pressed("ui_select"):
		bird.flap()
	
	if game_state == "menu" and Input.is_action_pressed("ui_select"):
		start_game()
	
	if game_state == "game_over" and Input.is_action_pressed("ui_select"):
		restart_game()

func start_game():
	score = 0
	bird.reset()
	pipe_spawner.reset()
	set_game_state("playing")
	audio_manager.play_start_sound()

func restart_game():
	get_tree().reload_current_scene()

func set_game_state(new_state: String):
	game_state = new_state
	ui_manager.update_game_state(game_state)

func on_pipe_passed():
	score += 1
	audio_manager.play_score_sound()
	ui_manager.update_score(score)
	# Increase difficulty
	if score % 5 == 0:
		pipe_spawner.increase_speed()

func on_collision():
	if score > high_score:
		high_score = score
		save_high_score()
	set_game_state("game_over")
	audio_manager.play_collision_sound()
	ui_manager.show_game_over(score, high_score)

func set_difficulty(diff: int):
	difficulty = diff
	pipe_spawner.set_difficulty(diff)

func save_high_score():
	var config = ConfigFile.new()
	config.set_value("game", "high_score", high_score)
	config.save("user://flappy_bird_config.cfg")

func load_high_score():
	var config = ConfigFile.new()
	var error = config.load("user://flappy_bird_config.cfg")
	if error == OK:
		high_score = config.get_value("game", "high_score", 0)
	ui_manager.update_high_score(high_score)