//
//  StorageProvider.swift
//  Persistence
//
//  Created by Rémi Bardon on 15/09/2021.
//  Copyright © 2022 Prose. All rights reserved.
//

import CoreData
import OSLog

/// A wrapper for Core Data's persistent container.
///
/// This wrapper is inspired by [Donny Wals](https://www.donnywals.com)' great
/// [Practical Core Data: A modern guide to the Core Data framework](https://gumroad.com/l/practical-core-data) book.
public final class StorageProvider {
    
    public enum StoreType {
        case persisted, inMemory
    }
    
    static var managedObjectModel: NSManagedObjectModel = {
        let bundle = Bundle(for: StorageProvider.self)
        
        guard let url = bundle.url(forResource: "Prose", withExtension: "momd") else {
            fatalError("Failed to locate `momd` file for Prose")
        }
        
        guard let model = NSManagedObjectModel(contentsOf: url) else {
            fatalError("Failed to load `momd` file for Prose")
        }
        
        return model
    }()
    
    public let container: NSPersistentContainer
    
    public static let shared = StorageProvider()
    
    public init(storeType: StoreType = .persisted) {
        Logger.persistence.trace("Creating `\(String(describing: storeType))` storage provider…")
        
        self.container = NSPersistentContainer(
            name: "Prose",
            managedObjectModel: Self.managedObjectModel
        )
        
        if storeType == .inMemory {
            let description = self.container.persistentStoreDescriptions.first
            description?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        self.container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Core Data store failed to load with error: \(error)")
            }
        }
        
        self.container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        self.container.viewContext.automaticallyMergesChangesFromParent = true
        
        Logger.persistence.trace("Successfully created `\(String(describing: storeType))` storage provider as `\(self.container.description)` with view context `\(self.container.viewContext.description)`")
    }
    
    public func saveContext() {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate.
                // You should not use this function in a shipping application,
                // although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
}
