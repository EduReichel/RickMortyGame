extends Node

export (PackedScene) var Roca
var Score 

func _ready():
	randomize()
	$Inicio.play()
	
func nuevo_juego():
	Score = 0
	$Player.incio($Position2D.position)   #Posición de incio del jugador
	$InicioTimer.start()
	$Interfaz.mostrar_mensaje("Listo!")
	$Interfaz.update(Score)
	$Inicio.stop()
	$Juego.play()

func game_over():
	$ScoreTimer.stop()
	$RocaTimer.stop()
	$Interfaz.game_over()
	$Juego.stop()
	$Muerte.play()
	$Inicio.play()
	
func _on_InicioTimer_timeout():
	$RocaTimer.start()
	$ScoreTimer.start()
	


func _on_ScoreTimer_timeout():
	Score += 1
	$Interfaz.update(Score)
	


func _on_RocaTimer_timeout():
	
	$Camino/RocaPosicion.set_offset(randi())
	
	var R = Roca.instance()
	add_child(R)
	
	var d = $Camino/RocaPosicion.rotation
	
	R.position = $Camino/RocaPosicion.position
	
	d +=  rand_range(- PI/4 ,PI/4)
	R.rotation = d
	
	R.set_linear_velocity(Vector2(rand_range(R.Velocidad_min, R.Velocidad_max), 0).rotated(d))

