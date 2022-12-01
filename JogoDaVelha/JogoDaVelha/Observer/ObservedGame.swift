//
//  ObservedObject.swift
//  JogoDaVelha
//
//  Created by usr_prime on 25/11/22.
//

import SwiftUI

class ObservedGame: ObservableObject {
    
    let linhas: Int
    let colunas: Int
    
    var jogoDaVelha: JogoDaVelhaCore
    
    let jogadores: [String]
    
    @Published var jogadorDaVez: String
    @Published var acabou: Bool = false
    @Published var inicio: Bool = false
    
    init(){
        self.jogoDaVelha = JogoDaVelhaCore()
        self.jogadores = [jogoDaVelha.jogadorUm, jogoDaVelha.jogadorDois]
        self.jogadorDaVez = jogoDaVelha.jogadorUm
        self.linhas = jogoDaVelha.linhas
        self.colunas = jogoDaVelha.colunas
    }
    
    func verTabuleiro(linha: Int, coluna: Int) -> String {
        return jogoDaVelha.verTabuleiro(linha: linha, coluna: coluna)
    }
    
    func adicionar(linha: Int, coluna: Int, jogadorDaVez: String){}
    
    func mudarJogador(){
        self.jogadorDaVez = jogadorDaVez == jogadores[0] ? jogadores[1] : jogadores[0]
    }
    
    func reiniciar() {
        self.acabou = false
        self.jogoDaVelha = JogoDaVelhaCore()
        self.jogadorDaVez = jogadores[0]
    }
    
    func iniciar(){
        self.jogoDaVelha = JogoDaVelhaCore()
        self.inicio = true
    }
    
    func acabar(){
        self.inicio = false
        self.jogadorDaVez = jogadores[0]
    }
    
}
