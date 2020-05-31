import accesorios.*

class Bici {
	const accesorio = []
	var property largo
	var property rodado
	var property marca
	
	method agregarAccesorio(unAccesorio){ accesorio.add(unAccesorio) }
	method altura() { return (rodado * 2.5) + 15}
	method velCrucero() {
		if (largo >= 120){
			return rodado + 6
		} else {
			return rodado + 2
		}
	}
	method carga() {return accesorio.sum({unAccesorio => unAccesorio.carga()})}
	method peso() {return (rodado / 2) + accesorio.sum({unAccesorio => unAccesorio.peso()})}
	method tieneLuz() { return accesorio.any({unAccesorio => unAccesorio.esLuminoso()})}
	method cantidadDeAccesoriosLivianos(){return accesorio.count({unAccesorio => unAccesorio.peso() <= 1})}
	method noTieneAccesorio(){return accesorio.isEmpty()}
}

object olmo {}
object legnano {}



