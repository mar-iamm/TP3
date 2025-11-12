extends CanvasLayer

@onready var panel = $Panel
@onready var respawn_button = $Panel/RespawnButton
@onready var resume_button = $Panel/ResumeButton

var is_paused: bool = false

func _ready() -> void:
	# Permet au menu de continuer à fonctionner même lorsque le jeu est en pause
	process_mode = Node.PROCESS_MODE_ALWAYS

	panel.visible = false

	resume_button.pressed.connect(_on_resume_pressed)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"): # touche ESC
		toggle_pause()

func toggle_pause() -> void:
	is_paused = !is_paused
	get_tree().paused = is_paused
	panel.visible = is_paused
	process_mode = Node.PROCESS_MODE_ALWAYS  # important pour continuer à recevoir les entrées
	
	
func _on_resume_pressed() -> void:
	if is_paused:
		toggle_pause()
