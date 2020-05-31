object farolito {
	method peso(){return 0.5}
	method carga(){return 0}
	method esLuminoso(){return true} 
}

object canasto {
	var property volumen
	method peso(){return volumen / 10}
	method carga(){return volumen * 2}
	method esLuminoso(){return false} 
}

object morral {
	var property largo
	var tieneOjoDeGato = false
	method modificarOjoDeGato(){tieneOjoDeGato = not tieneOjoDeGato}
	method peso(){return 1.2}
	method carga(){return largo / 3}
	method esLuminoso(){return tieneOjoDeGato} 
}

/*Punto 5: Solo habria que crear dichos objetos respetando el contrato para que sean polimorficos con los otros accesorios
 * y ademas modelar el objeto segun sus caracteristicas para poder utilizarlos
 */