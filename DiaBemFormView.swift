//
//  DiaBemFormView.swift
//  DiaBem
//
//  Created by Marcus Silva on 21/09/23.
//

import SwiftUI
import Foundation

struct DiaBemFormView: View {
    
    @State var fullName = ""
    @State var age = ""
    @State var weight: Double = 0.0
    @State var height: Int = 0
    
    @State var lastGlucoseMeasurementDate = Date()
    @State var glucose: Double = 0.0
    
    var body: some View {
        Form {
            Section(header: Text("Informações pessoais")) {
                TextField("Nome completo", text: $fullName)
                TextField("Idade", text: $age)
                TextField("Peso (kg)", value: $weight, formatter: NumberFormatter())
                TextField("Altura (cm)", value: $height, formatter: NumberFormatter())
            }
            
            Section(header: Text("Glicose")) {
                DatePicker("Data", selection: $lastGlucoseMeasurementDate, displayedComponents: [.date, .hourAndMinute])
                TextField("Glicose", value: $glucose, formatter: NumberFormatter())
            }
            
            NavigationLink(destination: Text("Destination"), label: {
                Text("Gerar relatorios")
                    .bold()
                    .frame(width: 280, height: 50)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(6.0)
                    .font(.system(size: 20, weight: .medium))
            })
        }
        .navigationTitle("Formulario")
        .navigationBarTitleDisplayMode(.inline)
    }
}
