//
//  Message+Ext.swift
//  Persistence
//
//  Created by Rémi Bardon on 28/03/2022.
//  Copyright © 2022 Prose. All rights reserved.
//

import Foundation

extension MessageEntity {
    
    public var date: Date {
        return Calendar.current.startOfDay(for: self.timestamp!)
    }
    
//    public func conversationJID(loggedInUser userJid: String) -> String {
//        if self.to == userJid {
//            return self.from!.jid!
//        } else {
//            return self.to!
//        }
//    }
    
}
