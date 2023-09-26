//
//  DataController.swift
//  DiaBem
//
//  Created by Marcus Silva on 25/09/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "GlucoseModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Falha ao carregar os dados \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Os dados foram salvos!")
        } catch let error as NSError {
            print("Erro ao salvar dados: \(error.localizedDescription)")
            print("Detalhes do erro: \(error.userInfo)")
        }
    }
    
    func addPerson(fullName: String, glucose: Double, age: Int16, weight: Double, height: Int16, context: NSManagedObjectContext) {
        
        let person = Person(context: context)
        person.id = UUID()
        person.date = Date()
        person.fullName = fullName
        person.glucose = glucose
        person.age = age
        person.weight = weight
        person.height = height
        
        if context.hasChanges {
            save(context: context)
        } else {
            print("Nenhuma mudança para salvar.")
        }
        
    }
    
    func editGlucose(person: Person, fullName: String, glucose: Double, context: NSManagedObjectContext) {
        person.date = Date()
        person.fullName = fullName
        person.glucose = glucose
        
        save(context: context)
    }
}
