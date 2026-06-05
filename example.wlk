class Nave{
  var velocidad 
  var direccion 

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

  method prepararViaje()

}

class NavesBaliza inherits Nave{
  var colorBaliza="azul"

  method colorBaliza() = colorBaliza

  method cambiarColorBaliza(color){
    colorBaliza=color
  }

  override method prepararViaje(){
    colorBaliza="verde"
    self.ponerseParaleloAlSol()
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
    self.cargarComida(4*pasajeros)
    self.cargarBebida(6*pasajeros)
    self.acercarseUnPocoAlSol()
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
      self.ponerseVisible()
      self.replegarMisiles()
      self.acelerar(15000)
      self.emitioMensaje("Saliendo en mision")
    }
  }
