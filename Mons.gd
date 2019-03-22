extends RigidBody2D

export (int) var Velocidad_min
export (int) var Velocidad_max



func _on_visibilidad_screen_exited():
	queue_free() #Eliminar roca
	
