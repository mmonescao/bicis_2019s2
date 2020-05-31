import bicis.*
import accesorios.*

class Deposito {
	const deposito = []
	const conLuz = []
	
	method agregarBici(unaBici){
		deposito.add(unaBici)
		if(unaBici.tieneLuz()){
			conLuz.add(unaBici)
		}
	}
	
	method bicisRapidas(){return deposito.filter({unaBici => unaBici.velCrucero() >= 25})}
	
	method marcas(){return deposito.map({unaBici => unaBici.marca()}).asSet()}
	
	method nocturno(){return deposito.all({unaBici => unaBici.tieneLuz()})}
	
	method puedeLlevar(unPeso){return deposito.any({unaBici => unaBici.carga() >= unPeso})}
	
	method marcaDeBiciMasRapida(){return deposito.max({unaBici => unaBici.velCrucero()}).marca()}
	
	method cargaTotalBicisLargas(){return deposito.filter({unaBici => unaBici.largo() >= 170}).sum({unaBici=>unaBici.carga()})}
	
	method cantidadDeBicisSinAccesorios(){return deposito.count({unaBici => unaBici.noTieneAccesorio()})}
	
	method encontrarCompanieras(unaBici){
		return deposito.filter({bici => bici.marca() == unaBici.marca()}).filter({bici => bici != unaBici}).filter({bici => (bici.largo()-unaBici.largo()).between(-10, 10)})
	}
	
	method tieneBicisCompanieras(){
		const aux =[]
		deposito.forEach({unaBici => aux.addAll(self.encontrarCompanieras(unaBici))})
		return not aux.isEmpty()
	}
	
	method parejaDeCompanieras(){
		const pares = []
		if(self.tieneBicisCompanieras()){
			deposito.forEach({unaBici => pares.add(self.agregarBicisCompanieras())})
		} 
		return pares
	}
	
	method agregarBicisCompanieras(){
		const aux = []
		deposito.forEach({unaBici => aux.addAll(self.encontrarCompanieras(unaBici))})
		aux.forEach({unaBici=> aux.addAll(self.encontrarCompanieras(unaBici))})
		return aux.asSet()
	}
	
	method seHizoLaLuz(){
		if(conLuz.size() >= 2){
			if(deposito.get(0).tieneLuz()){
				return deposito == conLuz
			} else {
				return deposito.drop(deposito.size() - conLuz.size()) == conLuz
			}
		} else {
			return false
		}
	}
}

