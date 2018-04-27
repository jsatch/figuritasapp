//
//  ViewController.swift
//  YalaNola
//
//  Created by Hernan Quintana on 3/26/18.
//  Copyright © 2018 Hernan Quintana. All rights reserved.
//

import UIKit

class ViewController: UIViewController, OnSwipeDelegate, OnTapDelegate {
    var stickerManager = StickersManager()
    
    //var arrJugadores = ["messi", "neymar"]
    /*var cont = 0 {
        didSet{
            if cont > arrJugadores.count - 1{
                cont = 0
            }
            sviJugadores.jugador = arrJugadores[cont]
        }
    };*/

    @IBOutlet weak var sviJugadores: StickerView!{
        didSet{
            sviJugadores.onSwipeDelegate = self
            sviJugadores.onTapDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imagen = stickerManager.repetidas[stickerManager.actualRepetidas].imagen{
            sviJugadores.jugador = imagen
        }
        sviJugadores.numero = stickerManager.repetidas[stickerManager.actualRepetidas].numero
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func onSwipeUp() {
        print("No La")
    }
    
    func onSwipeLeft() {
        stickerManager.actualRepetidas += 1
    }
    
    func onTap() {
        if sviJugadores.isCaraArriba{
            sviJugadores.isCaraArriba = false
        }else{
            sviJugadores.isCaraArriba = true
        }
    }
}

