//
//  ChatModel.swift
//  Prose
//
//  Created by Rémi Bardon on 27/03/2022.
//  Copyright © 2022 Prose. All rights reserved.
//

<<<<<<< Updated upstream:Prose/ProseLib/Sources/SharedModels/ChatModel.swift
public enum ChatID: Hashable {
    case person(id: String)
    case group(id: String)

    public var icon: Icon {
=======
import Persistence

enum ChatType: String {
    case chat = "chat"
    case groupChat = "groupchat"
    
    var icon: Icon {
>>>>>>> Stashed changes:Prose/Prose/Models/ChatModel.swift
        switch self {
        case .chat:
            return Icon.directMessage
        case .groupChat:
            return Icon.group
        }
    }
}

extension MessageEntity {
    
    var chatType: ChatType? {
        return self.to?.chatType
    }
    
}

extension RecipientEntity {
    
    var chatType: ChatType {
        switch self {
        case is UserEntity:
            return .chat
        case is ChatRoomEntity:
            return .groupChat
        default:
            #warning("Unsafe")
            fatalError("Missing case")
        }
    }
    
}
