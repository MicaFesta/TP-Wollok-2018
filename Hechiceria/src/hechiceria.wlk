// Punto 1: Hechicería

class Personaje {
	var hechizoFavorito
	var artefactosDeLucha
	var fuerzaOscura = 5
	var nombre
	var valorBaseLucha = 1
	
	constructor(unNombre, unHechizoFavorito, unosArtefactosDeLucha){
		nombre = unNombre
		hechizoFavorito = unHechizoFavorito
		artefactosDeLucha = unosArtefactosDeLucha
	}
	
	method estaCargado(){
		return artefactosDeLucha.size() > 5
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
		return artefactosDeLucha.sum({artefacto => artefacto.poderDeLucha(fuerzaOscura)})
	}
	
	method nivelDeHechiceria(){
		return (3 * hechizoFavorito.poder()) + fuerzaOscura
	}
	
	method cambiarHechizoFavorito(hechizoNuevo){
		hechizoFavorito = hechizoNuevo
	}

	method seCreePoderoso() {
		return hechizoFavorito.esPoderoso()
	}
	
	method eclipse() {
		fuerzaOscura = fuerzaOscura * 2
	}
	
	method fuerzaOscura(){
		return fuerzaOscura
	}
}

class EspectroMalefico {
	var nombre

	constructor(unNombre){
		nombre = unNombre
	}
	
	method cambiarNombre(unNombre){
		nombre = unNombre
	}

	method esPoderoso() {
		return nombre.size()>15
	}
	
	method poder() {
		return nombre.size()
	}	
}

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

	method poder() {
		return ( nombre.size() * valorPorElCualLoMultiplico )
	}
}

class Basico {

	method esPoderoso() {
		return false
	}

	method poder() {
		return 10
	}
}

//Punto 2: Lucha 

class ArmaCuerpoACuerpo {

	method poderDeLucha(fuerzaOscura) {
		return 3
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
	
	method poderDeLucha(fuerzaOscura) {
		return cantidadPerlas
	}
}

class MascaraOscura {
	var indiceOscuridad
	var minimo = 4

	constructor(unIndiceDeOscuridad){
		indiceOscuridad = unIndiceDeOscuridad
	}
	
	method cambiarMinimo(unMinimo){
		minimo = unMinimo
	}
	
	method poderDeLucha(fuerzaOscura) {
		return minimo.max((fuerzaOscura / 2 ) * indiceOscuridad)
	}
}

class Armadura {
	var mejora
	var valorBase
	
	constructor(unValorBase, unaMejora){
		valorBase = unValorBase
		mejora = unaMejora
	}
	
	method poderDeLucha(nivelDeHechizeria) {
		return valorBase + mejora.poderDeLucha(nivelDeHechizeria)
	}
}

//Punto 3

class CotaDeMalla {
	var calidad

	constructor(unaCalidad){
		calidad = unaCalidad
	}

	method poderDeLucha(nivelDeHechizeria) {
		return calidad
	}
}

class Bendicion {

	method poderDeLucha(nivelDeHechizeria) {
		return nivelDeHechizeria
	}
}

class Hechizo { //se toma poder de hechicería como el nivel del hechizo favorito, ya que la consiga no lo aclara
	method poderDeLucha(nivelDeHechizeria) {
		return nivelDeHechizeria
	}
}

class Ninguno {
	method poderDeLucha(nivelDeHechizeria) {
		return 0
	}
} 

object espejo { 
	method poderDeLucha ( listaDeArtefactos ) { 
		return listaDeArtefactos.max({ listaDeArtefactos.map({artefacto => artefacto.poderDeLucha()})}) 
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
}



//2) el espejo puede ser unico ya que no toma comportamiento adicional, en cambio pueden haber muchos libros
//con distintos hechizos, por lo que debe ser una clase.

//3) se provocaria un loop infinito.
