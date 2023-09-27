//
//  ContentView.swift
//  DiaBem
//
//  Created by Marcus Silva on 20/09/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var person: FetchedResults<Person>
    
    @State private var showingAddView = false
    
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                List {
                    ForEach(person) { person in
                        NavigationLink(destination: Text("\(person.glucose)")) {
                            VStack(alignment: .leading, spacing: 6.0) {
                                Text(person.fullName!)
                                    .font(.system(size: 22))
                                    .bold()
                                
                                HStack {
                                    Text("Glicose:")
                                        .foregroundStyle(.red)
                                        .bold()
                                    Text("\(Int(person.glucose))")
                                        .bold()
                                }
                                
                                HStack {
                                    Text("Idade: \(person.age)")
                                    Spacer()
                                    Text("Peso: \(Int(person.weight))")
                                    Spacer()
                                    Text("Altura: \(person.height)")
                                }
                                
                                Spacer()
                                
                                HStack {
                                    Spacer()
                                    Text(calcTimeSince(date: person.date!))
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                        .italic()
                                }
                            }
                            .padding(16)
                        }
                    }
                    .onDelete(perform: deleteGlucoseData)
                }
                .listStyle(.plain)
            }
            .navigationTitle("Glicose")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingAddView.toggle()
                    } label: {
                        Label("Add", systemImage: "plus.circle")
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddView) {
                DiaBemFormView()
            }
        }
        .padding()
    }
    
    private func deleteGlucoseData(offsets: IndexSet) {
        withAnimation {
            offsets.map { person[$0] }.forEach(managedObjContext.delete)
            
            DataController().save(context: managedObjContext)
        }
    }
}

#Preview {
    ContentView()
}
