//
//  ConversationScreen.swift
//  Prose
//
//  Created by Valerian Saliou on 11/21/21.
//

import Persistence
import SwiftUI

struct ConversationScreen: View {
    @FetchRequest private var messages: FetchedResults<MessageEntity>
    
    let jid: JID
    
    init(jid: JID) {
        self.jid = jid
        self._messages = FetchRequest(
            sortDescriptors: [
                SortDescriptor(\MessageEntity.timestamp)
            ],
            predicate: MessageEntity.fromPredicate(jid: jid)
        )
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ChatWithMessageBar(chatViewModel: .init(
                messages: messages.map(\.toMessageViewModel)
            ))
            
            Divider()
            
            ConversationDetailsView(
                jid: jid
            )
                .frame(width: 220.0)
        }
    }
}

struct ConversationScreen_Previews: PreviewProvider {
    static var previews: some View {
        ConversationScreen(jid: PreviewJIDs.alexandre.rawValue)
    }
}
