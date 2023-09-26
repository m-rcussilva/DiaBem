//
//  DiaBemFormView.swift
//  DiaBem
//
//  Created by Marcus Silva on 21/09/23.
//

import SwiftUI
import Foundation

struct DiaBemFormView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State var fullName = ""
    @State var age = ""
    @State var weight: Double = 0.0
    @State var height: Int = 0
    
    @State var lastGlucoseMeasurementDate = Date()
    @State var glucose: Double = 0.0
    
    @State private var showingAgeConversionError = false
    @State private var showingAddView = false
    
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
                Text("Glicose: \(Int(glucose))")
                Slider(value: $glucose, in: 0...500)
            }
            
            HStack {
                Spacer()
                Button(action: {
                    if let ageInt = Int(age) {
                        DataController().addPerson(fullName: fullName, glucose: glucose, age: Int16(ageInt), weight: weight, height: Int16(exactly: height)!, context: managedObjContext)
                        
                        print("Dados salvos com sucesso!")
                        dismiss()
                    } else {
                        showingAgeConversionError = true
                    }

                }) {
                    Text("Gerar relatórios")
                        .bold()
                        .frame(width: 280, height: 50)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(6.0)
                        .font(.system(size: 20, weight: .medium))
                }
                Spacer()
            }
        }
        .navigationTitle("Formulario")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DiaBemFormView()
}
