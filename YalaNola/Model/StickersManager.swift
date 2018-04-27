//
//  StickersManager.swift
//  YalaNola
//
//  Created by Hernan Quintana on 4/20/18.
//  Copyright © 2018 Hernan Quintana. All rights reserved.
//

import Foundation

struct StickersManager{
    //var misRepetidas: [Sticker]
    var repetidas: [Sticker]
    var nolas: [Sticker]
    
    var actualRepetidas: Int
    
    init() {
        repetidas = [
            Sticker(imagen: "neymar", numero: 500, nombre: "Neymar", club: "PSG", estado: .nola),
            Sticker(imagen: "messi", numero: 350, nombre: "Lionel Messi", club: "PSG", estado: .nola)
        ]
        nolas = []
        actualRepetidas = 0
    }
    
    
    
}
