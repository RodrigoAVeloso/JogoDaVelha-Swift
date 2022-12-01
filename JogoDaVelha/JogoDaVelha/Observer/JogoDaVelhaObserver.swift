//
//  JogoDaVelhaObserver.swift
//  JogoDaVelha
//
//  Created by usr_prime on 18/11/22.
//

import SwiftUI

class JogoDaVelhaObserver: ObservedGame {
    
    override func adicionar(linha: Int, coluna: Int, jogadorDaVez: String){
        jogoDaVelha.adicionar(linha: linha, coluna: coluna, jogadorDaVez)
        if jogoDaVelha.verTabuleiro(linha: linha, coluna: coluna) == jogadorDaVez {
            
            if jogoDaVelha.acabou(){
                if jogoDaVelha.empate(){
                    self.jogadorDaVez = "Empate"
                }
                acabou = true
            }else{
                mudarJogador()
            }
        }
    }
    
    
}
