//
//  coredata_self_programmingApp.swift
//  coredata_self_programming
//
//  Created by 최영호 on 10/19/23.
//

import SwiftUI

@main
struct coredata_self_programmingApp: App {
    @StateObject private var dataController = CoreDataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
            
        }
    }
}
