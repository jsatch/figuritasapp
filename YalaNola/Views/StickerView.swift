//
//  StickerView.swift
//  YalaNola
//
//  Created by Hernan Quintana on 3/27/18.
//  Copyright © 2018 Hernan Quintana. All rights reserved.
//

import UIKit

protocol OnSwipeDelegate {
    func onSwipeUp();
    func onSwipeLeft();
}

protocol OnTapDelegate {
    func onTap();
}

class StickerView: UIView {
    var numero: Int = 345
    var isCaraArriba: Bool = true{
        didSet{
            for view in self.subviews{
                view.removeFromSuperview()
            }
            setNeedsDisplay()
        }
    }
    var jugador: String = "neymar" {
        didSet{
            setNeedsDisplay()
        }
    }
    var onSwipeDelegate: OnSwipeDelegate?
    var onTapDelegate: OnTapDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Configurando los swipes
        let swipeLeftRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeftAction(_:)))
        let swipeUpRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeUpAction(_:)))
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapAction(_:)))
        swipeLeftRecognizer.direction = UISwipeGestureRecognizerDirection.left
        swipeUpRecognizer.direction = UISwipeGestureRecognizerDirection.up
        addGestureRecognizer(swipeLeftRecognizer)
        addGestureRecognizer(swipeUpRecognizer)
        addGestureRecognizer(tapRecognizer)
        
    }
    
    @objc func swipeLeftAction(_ gestureRecognizer: UIGestureRecognizer){
        if let delegate = onSwipeDelegate{
            delegate.onSwipeLeft()
        }else{
            print("No ha asignado un delegado para el gesto swipe left")
        }
    }
    
    @objc func swipeUpAction(_ gestureRecognizer: UIGestureRecognizer){
        if let delegate = onSwipeDelegate{
            delegate.onSwipeUp()
        }else{
            print("No ha asignado un delegado para el gesto swipe up")
        }
    }
    
    @objc func tapAction(_ gestureRecognizer: UIGestureRecognizer){
        if let delegate = onTapDelegate{
            delegate.onTap()
        }else{
            print("No ha asignado un delegado para el gesto tap")
        }
    }

    override func draw(_ rect: CGRect) {
        if isCaraArriba{
            dibujarJugador()
            dibujarSwipeLeft()
            dibujarSwipeUp()
        }else{
            dibujarNumero()
        }
        //dibujarRectangulo()
        
    }
    
    private func dibujarNumero(){
        let centro: CGPoint = CGPoint(x: self.bounds.midX, y: self.bounds.midY)
        let radio = self.frame.size.width/CGFloat(8)
        let arco = UIBezierPath(arcCenter: centro, radius: radio, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        arco.stroke()
        
        let labNumero = UILabel(frame: CGRect(x: self.bounds.midX - radio, y: self.bounds.midY - 15, width: radio*2, height: 30))
        labNumero.textAlignment = NSTextAlignment.center
        labNumero.text = String(self.numero)
        addSubview(labNumero)
    }
    
    private func dibujarSwipeLeft(){
        if let imagenSwipeLeft = UIImage(named: "swipe_left"){
            let alto = imagenSwipeLeft.cgImage!.height
            let ancho = imagenSwipeLeft.cgImage!.width
            
            print("alto:\(alto) ancho:\(ancho)")
            
            let swipeLeftView = UIImageView(frame: CGRect(x: (bounds.minX),
                                                          y: (bounds.minY + 16.0),
                                                          width: CGFloat(ancho),
                                                          height: CGFloat(alto))
            )
            swipeLeftView.image = imagenSwipeLeft
            swipeLeftView.isOpaque = false
            swipeLeftView.zoom(en: 0.5)
            addSubview(swipeLeftView)
            
        }
    }
    
    private func dibujarSwipeUp(){
        if let imagenSwipeUp = UIImage(named: "swipe_up"){
            let alto = imagenSwipeUp.cgImage!.height
            let ancho = imagenSwipeUp.cgImage!.width
            
            print("alto:\(alto) ancho:\(ancho)")
            
            let swipeUpView = UIImageView(frame: CGRect(x: (bounds.maxX - CGFloat(ancho)),
                                                          y: (bounds.minY + 16.0),
                                                          width: CGFloat(ancho),
                                                          height: CGFloat(alto))
            )
            swipeUpView.image = imagenSwipeUp
            swipeUpView.zoom(en: 0.5)
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
            }else if imagenJugadorView.frame.width < bounds.width{
                //Caso en que tamano imagen sea menor al tamano de la pantalla
                imagenJugadorView.frame.size.width = bounds.width
                imagenJugadorView.frame.size.height = imagenJugadorView.frame.size.width * (1/aspectRatio)
            }

            addSubview(imagenJugadorView)
            //imagenJugador.draw(in: CGRect(x: 0, y: 0, width: imagen.width, height: imagen.height))
        }
    }
}

extension UIImageView{
    
    func zoom(en porcentaje: CGFloat){
        self.frame.size.width = self.frame.size.width * porcentaje
        self.frame.size.height = self.frame.size.height * porcentaje
    }
}

