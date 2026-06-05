class Nave{
  var velocidad 
  var direccion 
  var combustible = 0

  method velocidad()=velocidad
  method direccion() = direccion

  method acelerar(cuanto){
    velocidad+=cuanto
    velocidad= velocidad.min(100000)
  }

  method desacelerar(cuanto){
    velocidad-=cuanto
    velocidad= velocidad.max(0)
  }

  method irHaciaElSol(){
    direccion = 10
  }

  method escaparDelSol(){
    direccion = -10
  }

  method ponerseParaleloAlSol() {
    direccion = 0
  }

  method acercarseUnPocoAlSol(){
    direccion += 1
    direccion.min(10)
  }

  method alejarseUnPocoDelSol(){
    direccion -= 1
    direccion.max(-10)
  }

  method combustible()=combustible

  method cargarCombustible(cuanto) {
    combustible+=cuanto
  }

  method descargarCombustible(cuanto){
    combustible-=cuanto
  }

  method prepararViaje(){
    self.cargarCombustible(3000)
    self.acelerar(5000)
  }

  method estaTranquila() {
    return self.combustible()>=4000 and self.velocidad()<=12000
  } 

}

class NavesBaliza inherits Nave{
  var colorBaliza="azul"

  method colorBaliza() = colorBaliza

  method cambiarColorBaliza(color){
    colorBaliza=color
  }

  override method prepararViaje(){
    super()
    colorBaliza="verde"
    self.ponerseParaleloAlSol()
    
  }

  override method estaTranquila(){
    return super() and colorBaliza != "rojo"
  }


  method escapar(){
    self.irHaciaElSol()
  }

  method avisar(){
    colorBaliza="rojo"
  }


  method recibirAmenaza(){
    self.escapar()
    self.avisar()
  }

}

class NavesDePasajero inherits Nave{
  var pasajeros 
  var racionesDeComida
  var racionesDeBebida

  method pasajeros() =pasajeros
  method racionesDeComida()= racionesDeComida
  method racionesDeBebida() = racionesDeBebida  

  method cargarComida(cuanto){
    racionesDeComida+=cuanto
  }

  method cargarBebida(cuanto){
    racionesDeBebida+=cuanto
  }

  method descargarcomida(cuanto){
    racionesDeComida-=cuanto
  }

  method descargarBebida(cuanto){
    racionesDeBebida-=cuanto
  }

  override method prepararViaje(){
    super()
    self.cargarComida(4*pasajeros)
    self.cargarBebida(6*pasajeros)
    self.acercarseUnPocoAlSol()
    
  }

  method escapar(){
    velocidad = velocidad*2
  }
  


  method avisar(){
    descargarComida(pasajeros)
    
  }

  method recibirAmenaza(){
    self.escapar()
    self.avisar()
  }

  
  }

  class NavesDeCombate inherits Nave{
    var estaInvisible= false
    var misilesEstanDesplegados = false
    var mensajesEmitidos=[]

    method estaInvisible()=estaInvisible

    method ponerseVisible(){estaInvisible=false}
    method ponerseInvisible(){estaInvisible=true}

    method desplegarMisiles(){misilesEstanDesplegados=true}
    method replegarMisiles(){misilesEstanDesplegados=false}

    method mensajesEmitidos()=mensajesEmitidos

    method emitirMensaje(mensaje) {
      mensajesEmitidos.add(mensaje)
    }

    method primerMensajeEmitido(){
      return mensajesEmitidos.first()
    }

    method ultimoMensajeEmitido(){
      return mensajesEmitidos.last()
    } 

    method esEscueta(){
      return mensajesEmitidos.all{texto=>texto.size()<=30}

    }

    method emitioMensaje(mensaje){
      return mensajesEmitidos.any{m=> m == mensaje}
    }

    override method prepararViaje(){
      super()
      self.ponerseVisible()
      self.replegarMisiles()
      self.acelerar(15000)
      self.emitioMensaje("Saliendo en mision")
      self.acelerar(15000)
    }

    override method estaTranquila(){
    return super() and !misilesEstanDesplegados
  }

  }

class NaveHospital inherits NavesDePasajero{
  var tienePreparadoLosQuirofanos= false

  method tienePreparadoLosQuirofanos()= tienePreparadoLosQuirofanos

  method prepararQuirofanos(){tienePreparadoLosQuirofanos=true}

  method usarQuirofanos() {tienePreparadoLosQuirofanos=false}

  override method estaTranquila() {
    return super() and !tienePreparadoLosQuirofanos
  } 

}

class NaveDeCombateSigilosa inherits NavesDeCombate{
  

  override method estaTranquila() {
    return super() and !self.estaInvisible()
  } 


}
