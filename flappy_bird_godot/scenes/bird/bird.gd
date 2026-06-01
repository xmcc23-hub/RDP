extends Area2D
class_name Bird

var velocity = Vector2.ZERO
var gravity = 800
var flap_strength = -400
var max_fall_speed = 500
var rotation_speed = 5
var max_rotation = 1.2  # radians

@onready var animated_sprite = $AnimatedSprite2D
@onready var collision_shape = $CollisionShape2D
@onready var game_manager = get_parent()

func _ready():
	area_entered.connect(_on_area_entered)

body_entered.connect(_on_body_entered)

func _physics_process(delta):
	if game_manager.game_state == "playing":
		# Apply gravity
		velocity.y += gravity * delta
		velocity.y = min(velocity.y, max_fall_speed)
		
		# Update position
		global_position.y += velocity.y * delta
		
		# Rotate bird based on velocity
		rotation = clamp(velocity.y / 300.0, -max_rotation, max_rotation)
		
		# Animate wings
		animated_sprite.play("default")
		
		# Check if bird fell below screen
		if global_position.y > get_viewport_rect().size.y:
			game_manager.on_collision()
	else:
		# Idle animation in menu
		animated_sprite.play("idle")

func flap():
	velocity.y = flap_strength

func reset():
	global_position = Vector2(100, 300)
	velocity = Vector2.ZERO
	rotation = 0

func _on_area_entered(area):
	if area.is_in_group("pipes"):
		game_manager.on_collision()

func _on_body_entered(body):
	if body.is_in_group("ground"):
		game_manager.on_collision()