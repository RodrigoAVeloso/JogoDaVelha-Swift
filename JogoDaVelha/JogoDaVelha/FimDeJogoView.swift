//
//  FimDeJogoView.swift
//  JogoDaVelha
//
//  Created by usr_prime on 18/11/22.
//

import SwiftUI

struct FimDeJogoView: View {
    
    var vencedor: String
    var reiniciar: () -> Void
    
    var body: some View {
        GeometryReader { view in
            VStack {
                ZStack{
                    Circle().foregroundColor(.purple)
                    if vencedor == "Empate" {
                        VStack {
                            Text("Empatee")
                                .font(.custom("Avenir Black", size: 75))
                                .foregroundColor(.white)
                            Text("Deu Velha :(")
                                .font(.custom("Avenir Black", size: 50))
                                .foregroundColor(.white)
                        }
                    }else{
                        VStack {
                            Text("O vencedor foi:")
                                .font(.custom("Avenir Black", size: 50))
                                .foregroundColor(.white)
                            Text(vencedor)
                                .font(.custom("Avenir Black", size: 50))
                                .foregroundColor(.white)
                        }
                    }
                }
                
                Button("Reiniciar"){
                    reiniciar()
                }
                .frame(width: 150,height: 50)
                .font(.custom("Avenir", size: 30))
                .padding()
                .background(.cyan)
                .foregroundColor(.white)
                .cornerRadius(10.0)
                
                
            }
            .frame(width: view.size.width,height: view.size.height)
            .background(Color.black)
        }
    }
}

struct FimDeJogoView_Previews: PreviewProvider {
    static var previews: some View {
        FimDeJogoView(vencedor: "X", reiniciar: {})
    }
}
