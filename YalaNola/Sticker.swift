//
//  Sticker.swift
//  YalaNola
//
//  Created by Hernan Quintana on 4/22/18.
//  Copyright © 2018 Hernan Quintana. All rights reserved.
//

import Foundation

enum EstadoSticker {
    case nola
    case yala
    case repetida
}

class Sticker {
    var imagen: String?
    var numero: Int
    var nombre: String
    var club: String?
    var estado: EstadoSticker
    
    init(imagen: String, numero: Int, nombre: String,
         club: String, estado: EstadoSticker) {
        self.imagen = imagen
        self.numero = numero
        self.nombre = nombre
        self.club = club
        self.estado = estado
    }
    init(numero: Int, nombre: String, estado: EstadoSticker) {
        self.numero = numero
        self.nombre = nombre
        self.estado = estado
    }
}
