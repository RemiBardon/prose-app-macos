//
//  StorageProvider+User.swift
//  Persistence
//
//  Created by Rémi Bardon on 27/03/2022.
//  Copyright © 2022 Prose. All rights reserved.
//

import CoreData
import OSLog

extension StorageProvider {
    
    public func getUser(withId jid: String) -> UserEntity? {
        let request: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        request.predicate = UserEntity.jidPredicate(jid)
        request.fetchLimit = 1
        
        do {
            return try self.container.viewContext.fetch(request).first
        } catch {
            Logger.persistence.error("Failed to fetch user with jid '\(jid)': \(String(describing: error))")
            return nil
        }
    }
    
}
