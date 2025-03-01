extends CharacterBody2D

# Configuración de gravedad y velocidad
@onready var gravity: int = ProjectSettings.get("physics/2d/default_gravity")
@export var speed = 100

# Variable para indicar la dirección del movimiento (1: derecha, -1: izquierda)
var sentido = 1

# Inicialización
func _ready() -> void:
	$ani_esqueleto.play("default")

# Detección de colisión con el jugador
func _on_ene_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("jugadores"):
		$audio_perderVida.play()
		await $audio_perderVida.finished
		body.perder_vida()

# Lógica de física
func _physics_process(delta: float) -> void:
	# Aplica la gravedad
	velocity.y += gravity * delta

	# Cambia de dirección si choca con una pared
	if is_on_wall():
		sentido = -sentido

	# Movimiento hacia la derecha
	if sentido == 1:
		if $one_area/detectorIDerecha.is_colliding():
			velocity.x = speed
			$ani_esqueleto.flip_h = false
		else:
			sentido = -1

	# Movimiento hacia la izquierda
	elif sentido == -1:
		if $one_area/detectorIzquierda.is_colliding():
			velocity.x = -speed
			$ani_esqueleto.flip_h = true
		else:
			sentido = 1

	# Aplica el movimiento
	move_and_slide()
