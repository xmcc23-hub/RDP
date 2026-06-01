extends Node2D
class_name PipeSpawner

const PIPE_SCENE = preload("res://scenes/pipes/pipe.tscn")

var spawn_timer = 0.0
var spawn_interval = 2.0
var pipe_speed = 200
var gap_size = 120
var min_gap_y = 100
var max_gap_y = 300
var difficulty = 1

@onready var game_manager = get_parent()

func _ready():
	spawn_interval = 2.0

func _process(delta):
	if game_manager.game_state == "playing":
		spawn_timer += delta
		
		if spawn_timer >= spawn_interval:
			spawn_pipe()
			spawn_timer = 0.0
		
		# Move all pipes
		for pipe in get_children():
			if pipe is Node2D and pipe.name != "PipeSpawner":
				pipe.global_position.x -= pipe_speed * delta
				
				# Remove pipes that went off screen
				if pipe.global_position.x < -100:
					pipe.queue_free()
else:
	# Clear pipes in menu
	for pipe in get_children():
		if pipe is Node2D and pipe.name != "PipeSpawner":
			pipe.queue_free()

func spawn_pipe():
	var pipe = PIPE_SCENE.instantiate()
	var gap_y = randf_range(min_gap_y, max_gap_y)
	
	pipe.setup(gap_y, gap_size)
	pipe.global_position.x = get_viewport_rect().size.x + 50
	
	add_child(pipe)

func reset():
	spawn_timer = 0.0
	for pipe in get_children():
		if pipe is Node2D:
			pipe.queue_free()

func increase_speed():
	pipe_speed += 20
	spawn_interval = max(spawn_interval - 0.1, 1.0)

func set_difficulty(diff: int):
	difficulty = diff
	match diff:
		1:  # Easy
			gap_size = 150
			spawn_interval = 2.5
			pipe_speed = 150
		2:  # Normal
			gap_size = 120
			spawn_interval = 2.0
			pipe_speed = 200
		3:  # Hard
			gap_size = 90
			spawn_interval = 1.5
			pipe_speed = 250