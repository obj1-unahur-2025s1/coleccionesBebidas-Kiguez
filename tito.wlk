object tito {
    var cantidad = 0
    var bebida = cianuro
    method peso() = 70
    method inerciaBase() = 490
    method consumir(unaCantidad,unaBebida) {
        bebida = unaBebida
        cantidad = unaCantidad
    }
    method bebida() = bebida

    method velocidad() {
        return bebida.rendimiento(cantidad)
        * self.inerciaBase() / self.peso()
    }
}

object wisky {
    method rendimiento(cantidad) = 0.9 ** cantidad
}
object cianuro {
    method rendimiento(cantidad) = 0
}

object terere {
    method rendimiento(cantidad) {
        return 1.max(cantidad * 0.1)
        //tambien (cantidad * 0.1).max(1)
    }
}

object licuado {
    const nutrientes = []

    method rendimiento(cantidad) {
        return
            nutrientes.sum() * ((cantidad/1000).truncate(0))
    }
       
    method agregar(nutriente) {
        nutrientes.add(nutriente)
    }
}

object aguaSaborizada {
    var bebida = wisky
    method rendimiento(cantidad) {
        return
            1 + bebida.rendimiento(cantidad * 0.25)
    }

    method bebida(nueva) {
        bebida = nueva
    }
}

object coctelDeBebidas {
    const bebidas = [wisky , terere]

    method rendimiento(cantidad) {
        var rendimiento = 1
        bebidas.forEach({b=> rendimiento = b.rendimiento(cantidad) * rendimiento})
        return
            rendimiento
    }

    method agregarBebida(bebida) {
      bebidas.add(bebida)
    }

}

object coctelSuave {
    const bebidas = [wisky , terere]
    method rendimiento(cantidad) {
        const bebidasAConsiderar = bebidas.filter({b=>b.rendimiento(cantidad)>0.5})
        return bebidasAConsiderar.sum({b=>b.rendimiento(cantidad)})
    }
    method rendimientoBis(cantidad) = bebidas.filter({b=>b.rendimiento(cantidad)>0.5}).sum({b=>b.rendimiento(cantidad)})
}