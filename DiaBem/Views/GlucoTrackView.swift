//
//  LineChartView.swift
//  DiaBem
//
//  Created by Marcus Silva on 22/09/23.
//

//import SwiftUI
//import CoreData
//
//struct GlucoTrackView: View {
//    
//    @Environment(\.managedObjectContext) var managedObjContext
//    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var person: FetchedResults<Person>
//   
//    @State private var showingAddView = false
//    
//    var body: some View {
//        
//        VStack(alignment: .leading) {
//            Text("Hello")
//            List {
//                ForEach(person) { person in
//                    NavigationLink(destination: Text("\(person.glucose)")) {
//                        HStack {
//                            VStack(alignment: .leading, spacing: 6.0) {
//                                Text(person.fullName!)
//                                    .bold()
//                                Text("\(Int(person.glucose))") + Text("Glicose").foregroundStyle(.red)
//                                Text("\(person.age)")
//                                Text("\(person.weight)")
//                                Text("\(person.height)")
//                            }
//                            Spacer()
//                            
//                            Text(calcTimeSince(date: person.date!))
//                                .foregroundStyle(.gray)
//                                .italic()
//                        }
//                    }
//                }
//                .onDelete(perform: deleteGlucoseData)
//            }
//            .listStyle(.plain)
//        }
//        .navigationTitle("Glicose")
//        .toolbar {
//            ToolbarItem(placement: .topBarTrailing) {
//                Button {
//                    showingAddView.toggle()
//                } label: {
//                    Label("Add", systemImage: "plus.circle")
//                }
//            }
//            ToolbarItem(placement: .topBarLeading) {
//                EditButton()
//            }
//        }
//        .sheet(isPresented: $showingAddView) {
//            DiaBemFormView()
//        }
//        
//    }
//    
//    private func deleteGlucoseData(offsets: IndexSet) {
//        
//    }
//}
//
//#Preview {
//    GlucoTrackView()
//}
