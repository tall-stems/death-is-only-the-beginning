extends KinematicBody2D;

var moveRightSprite = preload("res://assets/player.png")
var moveleftSprite = preload("res://assets/playerleft.png")
var attackSprite = preload("res://assets/playerattack.png")

var velocity : Vector2 = Vector2()
var direction : Vector2 = Vector2()
onready var sprite : Sprite = get_node("Sprite")

func read_input():
	velocity = Vector2()
	if Input.is_action_pressed('up'):
		velocity.y -= 1
		direction = Vector2(0,-1)
		sprite.set_texture(moveRightSprite)

	if Input.is_action_pressed('down'):
		velocity.y += 1
		direction = Vector2(0,1)
		sprite.set_texture(moveleftSprite)

	if Input.is_action_pressed('left'):
		velocity.x -= 1
		direction = Vector2(-1,0)
		sprite.set_texture(moveleftSprite)

	if Input.is_action_pressed('right'):
		velocity.x += 1
		direction = Vector2(1,0)
		sprite.set_texture(moveRightSprite)
		
	velocity = velocity.normalized()
	velocity = move_and_slide(velocity * 200)


func _physics_process(delta):
	read_input()
