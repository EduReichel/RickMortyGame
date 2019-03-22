extends CanvasLayer

signal inciar_juego

func mostrar_mensaje(texto):
	$Mensaje.text = texto
	$Mensaje.show()
	$Mensaje_Timer.start()
	
func game_over():
	mostrar_mensaje("Game Over")
	yield($Mensaje_Timer, "timeout")
	$Button.show()
	$Mensaje.text = "Morty"
	$Mensaje.show()
	
func update(Puntos):
	$Score.text = str(Puntos)

func _on_Mensaje_Timer_timeout():
	$Mensaje.hide()


func _on_Button_pressed():
	$Button.hide()
	emit_signal("inciar_juego")
	
