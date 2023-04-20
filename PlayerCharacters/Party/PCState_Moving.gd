extends PC_BaseStates

@export
var move_speed : float = 300

func input(event : InputEvent) -> int:
	if Input.is_action_just_pressed("interact") || Input.is_action_just_pressed("up"):
		return PC_State.Interacting
	if !Input.is_anything_pressed():
		return PC_State.Idle
	
	return PC_State.Null
	
func process(delta:float) -> int:
	return PC_State.Null

func physics_process(delta: float) -> int:
	var moveDirection : float
	if Input.is_action_pressed("right"):
		moveDirection = Vector2.RIGHT.x
	if Input.is_action_pressed("left"):
		moveDirection = Vector2.LEFT.x
	if !Input.is_anything_pressed():
		moveDirection = 0
	
	for member in party:
		member.position.x += moveDirection * move_speed * delta
	
	if moveDirection == 0:
		return PC_State.Idle
		
	return PC_State.Null
