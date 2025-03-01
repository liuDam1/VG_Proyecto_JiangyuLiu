extends Control


func actualizar(monedas:int):
	$hbox_contador/label_contador.text = str(monedas)

func actualizarVida(vida: int):
	$hbox_contador_vida/label_contador_vida.text = str(vida)
