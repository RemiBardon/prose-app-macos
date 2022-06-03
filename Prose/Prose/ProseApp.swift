//
//  ProseApp.swift
//  Prose
//
//  Created by Valerian Saliou on 9/14/21.
//

import App
import SettingsFeature
import SwiftUI

@main
struct ProseApp: App {
    @Environment(\.storageProvider) private var storageProvider
    
    var body: some Scene {
        WindowGroup {
<<<<<<< Updated upstream
            AppView()
=======
            BaseView()
                // `.storageProvider` has a default value, but the setter,
                // wich updates the managed object context,
                // is not called on default value initialization.
                .environment(\.managedObjectContext, self.storageProvider.container.viewContext)
>>>>>>> Stashed changes
        }
        .windowStyle(DefaultWindowStyle())
        .windowToolbarStyle(UnifiedWindowToolbarStyle())
        .commands {
            SidebarCommands()

            CommandMenu("TODO Menu") {
                Button("Say Hello") {
                    print("Hello!")
                }
                .keyboardShortcut("h")
            }

            AppSettings()
        }
    }
}
