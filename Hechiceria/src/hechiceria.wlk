// Punto 1: Hechicería

class Personaje {
	var hechizoFavorito
	var artefactosDeLucha = [ ]
	var nombre
	var dinero = 100
	var valorBaseLucha = 1
	
	constructor(unNombre, unHechizoFavorito, unosArtefactosDeLucha){
		nombre = unNombre
		hechizoFavorito = unHechizoFavorito
		artefactosDeLucha = unosArtefactosDeLucha
	}

	method agregarArtefacto(unArtefacto){
		artefactosDeLucha.add(unArtefacto)
	}
	
	method quitarArtefacto(unArtefacto){
		artefactosDeLucha.remove(unArtefacto)
	}
	
	method quitarTodosLosArtefactos(){
		artefactosDeLucha.clear()
	}
	
	method modificarValorBaseDeLucha(unValor){
		valorBaseLucha = unValor
	}
	
	method nivelDeLucha(){
		return valorBaseLucha + self.aporteDeLosArtefactos()
	}
	
	method poderDeLuchaVSNivelHechiceria(){
		return self.nivelDeLucha() > self.nivelDeHechiceria()
	}
	
	method aporteDeLosArtefactos(){
		return artefactosDeLucha.sum({artefacto => artefacto.poderDeLucha()})
	}
	
		method nivelDeHechiceria(){
		return (3 * hechizoFavorito.poder()) + poderOscuro.fuerzaOscura()
	}
	
	method cambiarHechizoFavorito(hechizoNuevo){
		hechizoFavorito = hechizoNuevo
	}

	method seCreePoderoso() {
		return hechizoFavorito.esPoderoso()
	}

	method estaCargado(){
		return artefactosDeLucha.size() > 5
	}
	
	method comprar(unEquipamiento){
		if( dinero >= unEquipamiento.precio() ){
			artefactosDeLucha.add(unEquipamiento)
			dinero -= (unEquipamiento.precio() - (hechizoFavorito.precio()/2))
			self.cambiarHechizoFavorito(unEquipamiento)
			} else {
				error.throwWithMessage("No te alcanza la biyuya")
				//hacer tst del error
			}
	  }
	  
	  method cumplirObjetivo(){
	  	dinero += 10
	  }
}

/* 
class EspectroMalefico {
	var nombre

	constructor(unNombre){
		nombre = unNombre
	}

	method esPoderoso() {
		return true
	}

	method nivelDeHechizeria(fuerzaOscura) {
		return ( 3 * 17 ) + fuerzaOscura
	}
	
} */

class Logos {
	var nombre
	var valorPorElCualLoMultiplico

	constructor(unNombre, unValor){
		nombre = unNombre
		valorPorElCualLoMultiplico = unValor
	}

	method esPoderoso() {
		return nombre.size()>15
	}

	method nivelDeHechizeria() {
		return ( nombre.size() * valorPorElCualLoMultiplico ) + poderOscuro.fuerzaOscura()
	}
	
	method poder() {
		return ( nombre.size() * valorPorElCualLoMultiplico )
	}
	
	method precio(){
		return self.nivelDeHechizeria()
	}
}

class HechizoBasico {

	method esPoderoso() {
		return false
	}

	method poderDeHechizeria() {
		return 10
	}
	
	method precio(){
		return 10
	}
}

//Punto 2: Lucha 

class ArmaCuerpoACuerpo {
	
 	method poderDeLucha() {
		return 3
	}
	
	method precio(){
		return 3 * self.poderDeLucha()
	}
}

class CollarDivino {
var cantidadPerlas

	constructor(unasPerlas){
		cantidadPerlas = unasPerlas
	}
	
	method cambiarCantidadDePerlas(nuevaCantidad){
		cantidadPerlas = nuevaCantidad
	}
	
	method poderDeLucha() {
		return cantidadPerlas
	}
	
	method precio(){
		return 2* cantidadPerlas
	}
}

class MascarasOscuras {
	var indiceOscuridad
	var minimo = 4

	constructor(unIndiceDeOscuridad){
		indiceOscuridad = unIndiceDeOscuridad
	}

	method cambiarMinimo(unMinimo){
		minimo = unMinimo
	}

	method poderDeLucha() {
		return minimo.max((poderOscuro.fuerzaOscura() / 2 ) * indiceOscuridad)
	}
	
	method precio(){
		return 0
	}
}

class Armadura {
	var mejora
	var valorBase
	
	constructor(unValorBase, unaMejora){
		valorBase = unValorBase
		mejora = unaMejora
	}
	
	method poderDeLucha() {
		return valorBase + mejora.poderDeLucha()
	}
	
	method precio(){
		return mejora.precio(self)
	}
	
	method valorBase(){
		return valorBase
	}
}

//Punto 3

class CotaDeMalla {
	var calidad

	constructor(unaCalidad){
		calidad = unaCalidad
	}

	method poderDeLucha() {
		return calidad
	}
	
	method precio(){
		return self.poderDeLucha()/2
	}
}


class Bendicion {


//el metodo de lucha deberia ser polimorfico
	method poderDeLucha(nivelDeHechizeria) {
		return nivelDeHechizeria
	}
	
	method precio(armadura){
		return armadura.valorBase()
	}	
}


class Hechizo { //se toma poder de hechicería como el nivel del hechizo favorito, ya que la consiga no lo aclara

	method poderDeLucha(nivelDeHechizeria) {
		return nivelDeHechizeria
	}
	
	method precio(armadura){
		return armadura.valorBase() + 3
	}	
	
}

class Ninguno {

	method poderDeLucha(nivelDeHechizeria) {
		return 0
	}
	
	method precio(){
		return 2
	}
} 

object espejo { 
	method poderDeLucha ( listaDeArtefactos ) { 
		return listaDeArtefactos.max({ listaDeArtefactos.map({artefacto => artefacto.poderDeLucha()})}) 
	} 
	
	method precio(){
		return 90
	}
}

class LibroDeHechizos {
	var listaHechizos
	
 	constructor(hechizos){
		listaHechizos = hechizos
	}
	
 	method poder() {
		return listaHechizos.sum({hechizo => hechizo.poder()})
	}
	
	method precio(){
		return (listaHechizos.size() * 10) + self.poder()
	}
}

object poderOscuro{
	var fuerza
	
	method fuerzaOscura(){
		return fuerza
	}
	
	method eclipse() {
		fuerza = fuerza * 2
	}
}

 //2) el espejo puede ser unico ya que no toma comportamiento adicional, en cambio pueden haber muchos libros
//con distintos hechizos, por lo que debe ser una clase.
 //3) se provocaria un loop infinito.
