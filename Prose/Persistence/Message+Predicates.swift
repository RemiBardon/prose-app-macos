//
//  Message+Predicates.swift
//  Persistence
//
//  Created by Rémi Bardon on 27/03/2022.
//  Copyright © 2022 Prose. All rights reserved.
//

import Foundation

extension MessageEntity {
    
    public static func isReadPredicate(_ isRead: Bool) -> NSPredicate {
        return NSPredicate(format: "%K == %@", #keyPath(MessageEntity.isRead), NSNumber(value: isRead))
    }
    
    public static func fromPredicate(jid: String) -> NSPredicate {
        return NSPredicate(format: "%K == %@", #keyPath(MessageEntity.from.jid), jid)
    }
    
}
