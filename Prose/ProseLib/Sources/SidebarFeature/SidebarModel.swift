//
//  SidebarModel.swift
//  Prose
//
//  Created by Valerian Saliou on 11/15/21.
//  Copyright © 2022 Prose. All rights reserved.
//

import SharedModels

public enum Route: Hashable {
    case unread, replies, directMessages, peopleAndGroups
<<<<<<< Updated upstream:Prose/ProseLib/Sources/SidebarFeature/SidebarModel.swift
    case chat(id: ChatID)
    case newMessage
=======
    case chat(jid: JID)
>>>>>>> Stashed changes:Prose/Prose/Models/SidebarModel.swift
}

struct SidebarItem: Hashable, Identifiable {
    let id: Route
    let title: String
    let image: String
    let count: UInt16
}

public struct UserCredentials: Equatable {
    public var jid: String

    public init(jid: String) {
        self.jid = jid
    }
}
