extends StaticBody3D
signal takeDamage

func sendSignal():
	emit_signal("takeDamage")
