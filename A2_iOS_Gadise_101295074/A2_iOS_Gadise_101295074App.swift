//
//  A2_iOS_Gadise_101295074App.swift
//  A2_iOS_Gadise_101295074
//
//  Created by Gadise Oli on 2026-04-09.
//

import SwiftUI

@main
struct A2_iOS_Gadise_101295074App: App {
    var body: some Scene {
        WindowGroup {

            ContentView()
                .environment(
                    \.managedObjectContext,
                    persistenceController.container.viewContext
                )
        }
    }
}


