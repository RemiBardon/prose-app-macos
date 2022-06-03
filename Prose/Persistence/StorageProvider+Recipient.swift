//
//  StorageProvider+Recipient.swift
//  Persistence
//
//  Created by Rémi Bardon on 28/03/2022.
//  Copyright © 2022 Prose. All rights reserved.
//

import CoreData
import OSLog

extension StorageProvider {
    
    public func getEntity(withJid jid: String) -> RecipientEntity? {
        let request: NSFetchRequest<RecipientEntity> = RecipientEntity.fetchRequest()
        request.predicate = RecipientEntity.jidPredicate(jid)
        request.fetchLimit = 1
        
        do {
            return try self.container.viewContext.fetch(request).first
        } catch {
            Logger.persistence.error("Failed to fetch XMPP entity with jid '\(jid)': \(String(describing: error))")
            return nil
        }
    }
    
    public func getName(forJid jid: String) -> String? {
        guard let entity = self.getEntity(withJid: jid) else { return nil }
        
        switch entity {
        case let user as UserEntity:
            return user.displayName
        case let chat as ChatRoomEntity:
            return chat.roomName
        default:
            return nil
        }
    }
    
}
