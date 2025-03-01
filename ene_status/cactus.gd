extends Area2D

func _on_body_entered(body: Node2D):
	if body.is_in_group("jugadores"):
		$audio_cactus.play()
		await $audio_cactus.finished
		body.perder_vida()
