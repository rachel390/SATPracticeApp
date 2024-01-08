//
//  SATAPPApp.swift
//  SATAPP
//
//  Created by Rachel Mills on 1/7/24.
//

import SwiftUI

@main
struct SATAPPApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            container()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
