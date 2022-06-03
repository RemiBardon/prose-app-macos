//
//  UnreadSection.swift
//  Prose
//
//  Created by Rémi Bardon on 27/03/2022.
//

import ConversationFeature
import ProseUI
import SharedModels
import SwiftUI

struct UnreadSection: View {
<<<<<<< Updated upstream:Prose/ProseLib/Sources/UnreadFeature/UnreadSection.swift
    let model: UnreadSectionModel

=======
    @Environment(\.storageProvider) private var storageProvider
    
    let chatJid: JID
    let chatType: ChatType
    let messages: [MessageViewModel]
    
>>>>>>> Stashed changes:Prose/Prose/Components/Content/Spotlight/Unread/UnreadSection.swift
    var body: some View {
        GroupBox {
            HStack {
                VStack {
                    ForEach(messages, content: MessageView.init(model:))
                }
                VStack {
                    Button {
                        print("Reply tapped")
                    } label: {
                        // FIXME: Localize
                        Label("Reply", systemImage: "arrowshape.turn.up.right")
                            .frame(maxWidth: .infinity)
                    }
                    .foregroundColor(.accentColor)
                    Button {
                        print("Mark read tapped")
                    } label: {
                        // FIXME: Localize
                        Text("Mark read")
                            .frame(maxWidth: .infinity)
                    }
                }
                .frame(width: 96)
                .labelStyle(.vertical)
                .buttonStyle(.shadowed)
            }
        } label: {
            HStack {
                Label(label(for: chatJid), systemImage: chatType.icon.rawValue)
                    .labelStyle(.coloredIcon)
                    .font(.title3.bold())
                Spacer()
                Text(messages.last!.timestamp, format: .relative(presentation: .named))
                    .foregroundColor(.secondary)
            }
        }
    }
<<<<<<< Updated upstream:Prose/ProseLib/Sources/UnreadFeature/UnreadSection.swift

    private func label(for chatId: ChatID) -> String {
        switch chatId {
        case let .person(id: userId):
            return UserStore.shared.user(for: userId)?.fullName ?? "Unknown"
        case let .group(id: groupId):
            return groupId
        }
=======
    
    private func label(for jid: JID) -> String {
        return self.storageProvider.getName(forJid: jid) ?? "Unknown"
>>>>>>> Stashed changes:Prose/Prose/Components/Content/Spotlight/Unread/UnreadSection.swift
    }
}

// struct UnreadSection_Previews: PreviewProvider {
//    static var previews: some View {
//        UnreadSection()
//    }
// }
