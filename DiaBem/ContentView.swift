//
//  ContentView.swift
//  DiaBem
//
//  Created by Marcus Silva on 20/09/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image("header-img")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
               
                HStack {
                    Text(Image(systemName: "plus.app.fill"))
                        .font(.system(size: 24))
                    Text("DiaBem")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }
                .padding()
                
                Text("Simplifique o controle da diabetes com este aplicativo de monitoramento de glicose")
                    .font(.system(size: 22, weight: .medium))
                    .multilineTextAlignment(.center)
                    .padding()
                
                NavigationLink(
                    destination: DiaBemFormView(),
                    label: {
                        Text("Iniciar")
                            .bold()
                            .frame(width: 280, height: 50)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(6.0)
                            .font(.system(size: 20, weight: .medium))
                    })
                .padding()
                Spacer()
            }
            .navigationTitle("Inicio")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(false)
            .navigationBarHidden(true)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
