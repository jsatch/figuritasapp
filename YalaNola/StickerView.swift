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
        
        dibujarJugador()
        dibujarSwipeLeft()
        dibujarSwipeUp()
        //dibujarRectangulo()
        
    }
    
    private func dibujarSwipeLeft(){
        if let imagenSwipeLeft = UIImage(named: "swipe_left"){
            let alto = imagenSwipeLeft.cgImage!.height
            let ancho = imagenSwipeLeft.cgImage!.width
            
            print("alto:\(alto) ancho:\(ancho)")
            
            let swipeLeftView = UIImageView(frame: CGRect(x: (bounds.minX + 16.0),
                                                          y: (bounds.maxY - CGFloat(alto) - 16.0),
                                                          width: CGFloat(ancho),
                                                          height: CGFloat(alto))
            )
            swipeLeftView.image = imagenSwipeLeft
            swipeLeftView.isOpaque = false
            addSubview(swipeLeftView)
            
        }
    }
    
    private func dibujarSwipeUp(){
        if let imagenSwipeUp = UIImage(named: "swipe_up"){
            let alto = imagenSwipeUp.cgImage!.height
            let ancho = imagenSwipeUp.cgImage!.width
            
            print("alto:\(alto) ancho:\(ancho)")
            
            let swipeUpView = UIImageView(frame: CGRect(x: (bounds.maxX - 16.0 - CGFloat(ancho)),
                                                          y: (bounds.maxY - CGFloat(alto) - 16.0),
                                                          width: CGFloat(ancho),
                                                          height: CGFloat(alto))
            )
            swipeUpView.image = imagenSwipeUp
            swipeUpView.isOpaque = false
            addSubview(swipeUpView)
            
        }
    }
    
    private func dibujarRectangulo(){
        let nuevoView = UIView(frame: CGRect(
            x: bounds.midX,
            y: bounds.midY,
            width: bounds.width/2,
            height: bounds.height/2)
        )
        nuevoView.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        addSubview(nuevoView)
    }
    
    private func dibujarJugador(){
        if let imagenJugador = UIImage(named: jugador), let imagen = imagenJugador.cgImage{
            
            print("\(imagen.width), \(imagen.height)")
            let imagenJugadorView = UIImageView(image: imagenJugador)
            imagenJugadorView.frame.origin.x = 0
            imagenJugadorView.frame.origin.y = 0
            
            let aspectRatio = imagenJugadorView.frame.size.width / imagenJugadorView.frame.size.height
            
            if imagenJugadorView.frame.width > bounds.width{
                // Achicamos el ancho hasta caber en el padre
                imagenJugadorView.frame.size.width = frame.width
                print("\(aspectRatio)")
                imagenJugadorView.frame.size.height = imagenJugadorView.frame.size.width * (1/aspectRatio)
                print("\(imagenJugadorView.frame.size.width), \(imagenJugadorView.frame.size.height)")
            }else if imagenJugadorView.frame.height > bounds.height {
                // Achicamos el alto hasta caber en el padre
                imagenJugadorView.frame.size.height = bounds.height
                imagenJugadorView.frame.size.width = imagenJugadorView.frame.size.width * (aspectRatio)
            }
            addSubview(imagenJugadorView)
            //imagenJugador.draw(in: CGRect(x: 0, y: 0, width: imagen.width, height: imagen.height))
        }
    }
    
    

}

