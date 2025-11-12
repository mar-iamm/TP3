extends Node

var coins = 0
var score = 0
var hasKey := false

@onready var jump_sound_player = $JumpSoundPlayer
@onready var magic_sound_player = $MagicSoundPlayer
@onready var death_sound_player = $DeathSoundPlayer
@onready var enemy_death_sound = $EnemyDeathSound
@onready var key_sound_player = $KeySoundPlayer

signal cle_collectee
var cle_recuperee: bool = false

const KEY_COLLECT_STREAM = preload("res://assets/Sounds/Retro Success Melody 02 - choir soprano.wav")

func debloquer_cle(key_item):
	cle_collectee.emit(key_item)

const JUMP_STREAM = preload("res://assets/Sounds/Retro Jump Classic 08.wav")

	
func _process(delta: float) -> void:
	$"HUD/CoinsValue".text = str(coins)
	$"HUD/ScoreValue".text = str(score)

func playSFX(stream):
	$CoinsSoundPlayer.stream = stream
	$CoinsSoundPlayer.play()
	
func play_jump_sound():
	if jump_sound_player:
		jump_sound_player.play()

func play_magic_sound():
	if magic_sound_player and not magic_sound_player.is_playing():
		magic_sound_player.play()

func play_death_sound():
	if death_sound_player and not death_sound_player.is_playing():
		death_sound_player.play()
		
func play_enemy_death_sound():
	if enemy_death_sound and not enemy_death_sound.is_playing():
		enemy_death_sound.play()
		
func play_key_collect_sound():
	if key_sound_player:
		key_sound_player.stream = KEY_COLLECT_STREAM
		key_sound_player.play()
		
	
