//
//  StickerView.swift
//  YalaNola
//
//  Created by Hernan Quintana on 3/27/18.
//  Copyright © 2018 Hernan Quintana. All rights reserved.
//

import UIKit

class StickerView: UIView {

    var jugador: String = "orejas"

    override func draw(_ rect: CGRect) {
        if let imagenJugador = UIImage(named: jugador), let imagen = imagenJugador.cgImage{
            
            print("\(imagen.width), \(imagen.height)")
            let imagenJugadorView = UIImageView(image: imagenJugador)
            imagenJugadorView.frame.origin.x = 0
            imagenJugadorView.frame.origin.y = 0
            //imagenJugadorView.frame.size.width = imagenJugadorView.frame.size.width / 2
            //imagenJugadorView.frame.size.height = imagenJugadorView.frame.size.height / 2
            let aspectRatio = imagenJugadorView.frame.size.width / imagenJugadorView.frame.size.height
            
            if imagenJugadorView.frame.width > bounds.width{
                // Achicamos el ancho hasta caber en el padre
                //let tempAncho = imagenJugadorView.frame.size.width
                imagenJugadorView.frame.size.width = frame.width
                print("\(aspectRatio)")
                imagenJugadorView.frame.size.height = imagenJugadorView.frame.size.width * (1/aspectRatio)
                print("\(imagenJugadorView.frame.size.width), \(imagenJugadorView.frame.size.height)")
            }else if imagenJugadorView.frame.height > bounds.height {
                // Achicamos el alto hasta caber en el padre
                //let tempAlto = imagenJugadorView.frame.size.height
                imagenJugadorView.frame.size.height = bounds.height
                imagenJugadorView.frame.size.width = imagenJugadorView.frame.size.width * (aspectRatio)
            }
            
            addSubview(imagenJugadorView)
            //imagenJugador.draw(in: CGRect(x: 0, y: 0, width: imagen.width, height: imagen.height))
        }
    }
    
    

}

