extends Window

func _ready():
	randomize()
	set_position(Vector2(randf() * get_viewport().get_size().x, randf() * get_viewport().get_size().y))
	set_process(true)

func _process(_delta):  # Prefix unused parameter with underscore
	check_direction()

func check_direction():
	var direction = Vector2.ZERO
	if is_on_screen(Vector2(0, 0)):
		direction.y = 1
	if is_on_screen(Vector2(get_viewport().get_size().x, 0)):
		direction.x = 1
	if is_on_screen(Vector2(get_viewport().get_size().x, get_viewport().get_size().y)):
		direction.y = -1
	if is_on_screen(Vector2(0, get_viewport().get_size().y)):
		direction.x = -1
	play_animation(direction)

func is_on_screen(point):
	var texturerect = get_node("TextureRect")
	var local_rect = texturerect.get_local_rect()  # Get the TextureRect's local rectangle
	var global_point = texturerect.to_global(point)  # Convert point to TextureRect's global space
	
	# Check if the point is within the TextureRect's rectangle in its global space
	return local_rect.has_point(global_point) and \
		   point.x >= 0 and point.x <= get_viewport().get_size().x and \
		   point.y >= 0 and point.y <= get_viewport().get_size().y


func play_animation(direction):
	if direction.x > 0:
		var subviewport_scene = get_node("SubViewport").get_viewport().get_scene()
		var animation_player = subviewport_scene.get_node("AnimationPlayer")
		animation_player.play("right")
	# ... repeat for other directions and adjust node access ...
