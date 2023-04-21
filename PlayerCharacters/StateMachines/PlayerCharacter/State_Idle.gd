extends State_Base

func input(event : InputEvent) -> int:
	if Input.is_action_just_pressed("left") || Input.is_action_just_pressed("right"):
		return Player_State.Moving
	if Input.is_action_just_pressed("interact"):
		return Player_State.Interacting
	return Player_State.Null

func physics_process(delta: float) -> int:
	return Player_State.Null
