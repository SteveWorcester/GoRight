extends PC_BaseStates

func input(event : InputEvent) -> int:
	if Input.is_action_just_pressed("left") || Input.is_action_just_pressed("right"):
		return PC_State.Moving
	if Input.is_action_just_pressed("interact"):
		return PC_State.Interacting	
	return PC_State.Null
	
func process(delta : float) -> int:
	return PC_State.Null
	
func physics_process(delta: float) -> int:
	if party[-1].velocity.x != 0:
		for member in party:
			member.velocity.x = 0
			member.move_and_slide()
	return PC_State.Null
