extends Window

@onready var drag_handle = get_node("DraggableControl")

func _gui_input(event):
	if event.is_action_pressed("ui_focus"):
		if drag_handle.dragging:
			# Change visual style to indicate dragging (e.g., change border color)
			drag_handle.modulate = Color.RED  # Example of changing border color
		else:
			# Revert visual style (optional)
			drag_handle.modulate = Color.WHITE  # Example of reverting color
