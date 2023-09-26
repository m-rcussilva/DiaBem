//
//  DiaBemApp.swift
//  DiaBem
//
//  Created by Marcus Silva on 20/09/23.
//

import SwiftUI

@main
struct DiaBemApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
