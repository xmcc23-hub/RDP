extends Node
class_name AudioManager

@onready var start_sound = $StartSound
@onready var score_sound = $ScoreSound
@onready var collision_sound = $CollisionSound
@onready var background_music = $BackgroundMusic

func _ready():
	background_music.play()

func play_start_sound():
	if start_sound.playing:
		start_sound.stop()
	start_sound.play()

func play_score_sound():
	if score_sound.playing:
		score_sound.stop()
	score_sound.play()

func play_collision_sound():
	if collision_sound.playing:
		collision_sound.stop()
	collision_sound.play()

func stop_music():
	background_music.stop()

func play_music():
	background_music.play()