//
//  ContentView.swift
//  JogoDaVelha
//
//  Created by usr_prime on 11/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.horizontalSizeClass) var horizontal
    
    @ObservedObject var jogoDaVelha = JogoDaVelhaObserver()
    @ObservedObject var jogoDaVelhaCPU = JogoDaVelhaCPUObserver()
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                HeaderView()
                
                VStack {
                    
                    Text("Multiplayer")
                        .font(.custom("Avenir Black", size: 20))
                    Button(action: {jogoDaVelha.iniciar() }, label: {
                        Image("play-icon")
                            .resizable()
                            .frame(width: self.horizontal == .compact ?  100 : 350, height: self.horizontal == .compact ?  100 : 350, alignment: .center)
                        
                    })
                    .padding(.bottom)
                                          
                }
                .fullScreenCover(isPresented: $jogoDaVelha.inicio, content: {
                    TabuleiroView(jogoDaVelha: jogoDaVelha)
                })
                .padding(.top)
                .offset(y: self.horizontal == .compact ? -150 : -175)
                
                VStack {
                    
                    Text("CPU")
                        .font(.custom("Avenir Black", size: 20))
                    Button(action: {jogoDaVelhaCPU.iniciar() }, label: {
                        Image("play-icon")
                            .resizable()
                            .frame(width: self.horizontal == .compact ?  100 : 350, height: self.horizontal == .compact ?  100 : 350, alignment: .center)
                        
                    })
                                          
                }
                .fullScreenCover(isPresented: $jogoDaVelhaCPU.inicio, content: {
                    TabuleiroView(jogoDaVelha: jogoDaVelhaCPU)
                })
                .padding(.top)
                .offset(y: self.horizontal == .compact ? -150 : -175)
                
                
                
            }
            .navigationTitle("Menu")
            .navigationBarHidden(true)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
}

struct HeaderView: View {
    
    @Environment(\.horizontalSizeClass) var horizontal
    
    var body: some View {
        GeometryReader {view in
            VStack {
                VStack {
                    Text("Jogo da Velha")
                        .offset(y: -25)
                }
                .frame(width: view.size.width, height: self.horizontal == .compact ? 250 : 400, alignment: .center)
                .font(.custom("Avenir Black", size: self.horizontal == .compact ? 50 : 75))
                .foregroundColor(.black)
                .background(.purple)
                
                Image("logo")
                    .resizable()
                    .frame(width: self.horizontal == .compact ?  120 : 240, height: self.horizontal == .compact ?  120 : 240, alignment: .center)
                    .offset(y: self.horizontal == .compact ?  -70 : -120)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
