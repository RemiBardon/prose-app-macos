//
//  Recipient+Predicates.swift
//  Persistence
//
//  Created by Rémi Bardon on 27/03/2022.
//  Copyright © 2022 Prose. All rights reserved.
//

import Foundation

extension RecipientEntity {
    
    public static func jidPredicate(_ jid: String) -> NSPredicate {
        return NSPredicate(format: "%K == %@", #keyPath(RecipientEntity.jid), jid)
    }
    
    public static func isFavoritedPredicate(_ isFavorited: Bool) -> NSPredicate {
        return NSPredicate(format: "%K == %@", #keyPath(RecipientEntity.isFavorited), NSNumber(value: isFavorited))
    }
    
}

