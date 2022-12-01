//
//  TabuleiroView.swift
//  JogoDaVelha
//
//  Created by usr_prime on 13/11/22.
//

import SwiftUI

struct TabuleiroView: View {
    
    @ObservedObject var jogoDaVelha: ObservedGame
    
    var body: some View {
        
        GeometryReader{ view in
            VStack{
                HStack{
                    Button(action: {jogoDaVelha.acabar()}, label: {
                        Text("Menu")
                            .font(.custom("Avenir Black", size: 20))
                            .foregroundColor(.cyan)
                    })
                    .frame(width: 100,height: 30)
                    .background(.black)
                    .cornerRadius(15)
                    .padding(.leading)
                    
                    Spacer()
                    
                    Button(action: {jogoDaVelha.reiniciar()}, label: {
                        Text("Reiniciar")
                            .font(.custom("Avenir Black", size: 20))
                            .foregroundColor(.cyan)
                    })
                    .frame(width: 100,height: 30)
                    .background(.black)
                    .cornerRadius(15)
                    .padding(.trailing)
                }
                .padding()
                
                Text("Vez: \(jogoDaVelha.jogadorDaVez)")
                    .font(.custom("Avenir Black", size: 50))
                
                Grid(jogoDaVelha: jogoDaVelha)
                    .position(x:215,y:475)
                    .padding(.top, -175)
            }
            .fullScreenCover(isPresented: $jogoDaVelha.acabou, content: {
                FimDeJogoView(vencedor: jogoDaVelha.jogadorDaVez, reiniciar: jogoDaVelha.reiniciar)
            })
        }
    }
        
        
}

struct Grid: View {
  
    @ObservedObject var jogoDaVelha: ObservedGame
    
    var body: some View{
        let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 3)
            
            LazyVGrid(columns: columns, spacing: 10){
                ForEach(0..<jogoDaVelha.linhas){ i in
                    ForEach(0..<jogoDaVelha.colunas){ j in
                        ZStack {
                            Color.purple.frame(height: 170)
                            Button(action: {
                                print("Clicou em \(i) e \(j)")
                                jogoDaVelha.adicionar(linha: i, coluna: j, jogadorDaVez: jogoDaVelha.jogadorDaVez)
                            }, label: {
                                    
                                    if jogoDaVelha.verTabuleiro(linha: i, coluna: j) != "" {
                                        
                                        Text(jogoDaVelha.verTabuleiro(linha: i, coluna: j))
                                            .font(.custom("Avenir Black", size: 50))
                                            .foregroundColor(.cyan)
                                        
                                    }else{
                                        Rectangle()
                                            .foregroundColor(.purple)
                                            .frame(height: 170)
                                    }
                            })
                        }
                    }
                }
            }
            .padding(.horizontal)
    }
}


struct TabuleiroView_Previews: PreviewProvider {
    static var previews: some View {
        let jogoDaVelha = JogoDaVelhaCPUObserver()
        TabuleiroView(jogoDaVelha: jogoDaVelha)
    }
}
