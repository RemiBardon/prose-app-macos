//
//  UnreadScreen.swift
//  Prose
//
//  Created by Rémi Bardon on 27/03/2022.
//

import ConversationFeature
import OrderedCollections
<<<<<<< Updated upstream:Prose/ProseLib/Sources/UnreadFeature/UnreadScreen.swift
import PreviewAssets
import ProseUI
import SharedModels
import SwiftUI

public struct UnreadScreenModel {
    let messages: OrderedDictionary<ChatID, [MessageViewModel]>

    public init(messages: OrderedDictionary<ChatID, [MessageViewModel]>) {
        self.messages = messages
    }

    func scope(for chatId: ChatID) -> UnreadSectionModel {
        UnreadSectionModel(
            chatId: chatId,
            messages: self.messages[chatId]!
        )
    }
}

public struct UnreadScreen: View {
    public let model: UnreadScreenModel

    public init(model: UnreadScreenModel) {
        self.model = model
    }

    public var body: some View {
        content()
            .background(Color.backgroundMessage)
            .toolbar(content: Toolbar.init)
    }

    @ViewBuilder
    private func content() -> some View {
        if self.model.messages.isEmpty {
            self.nothing()
=======
import Persistence
import SwiftUI

struct UnreadScreen: View {
    @Environment(\.storageProvider) private var storageProvider
    @Environment(\.jid) private var jid
    
    @SectionedFetchRequest(
        sectionIdentifier: \MessageEntity.from,
        sortDescriptors: [
            SortDescriptor(\MessageEntity.timestamp),
        ],
        predicate: MessageEntity.isReadPredicate(false)
    )
    private var messages
    
    var body: some View {
        if messages.isEmpty {
            nothing()
>>>>>>> Stashed changes:Prose/Prose/Components/Content/Spotlight/Unread/UnreadScreen.swift
        } else {
            self.list()
        }
    }

    @ViewBuilder
    private func nothing() -> some View {
        Text("Looks like you read everything 🎉")
            .font(.largeTitle.bold())
            .foregroundColor(.secondary)
            .padding()
    }

    @ViewBuilder
    private func list() -> some View {
        ScrollView {
            VStack(spacing: 24) {
                ForEach(self.messages) { messages in
                    UnreadSection(
                        chatJid: messages.first![keyPath: self.messages.sectionIdentifier]!.jid!,
                        chatType: messages.first!.chatType!,
                        messages: messages.map(\.toMessageViewModel)
                    )
                }
            }
            .padding(24)
        }
    }
}

<<<<<<< Updated upstream:Prose/ProseLib/Sources/UnreadFeature/UnreadScreen.swift
struct UnreadScreen_Previews: PreviewProvider {
    private struct Preview: View {
        var body: some View {
            UnreadScreen(model: .init(messages: OrderedDictionary(dictionaryLiteral:
                (ChatID.person(id: "id-valerian"), [
                    MessageViewModel(
                        senderId: "id-baptiste",
                        senderName: "Baptiste",
                        avatar: PreviewImages.Avatars.baptiste.rawValue,
                        content: "They forgot to ship the package.",
                        timestamp: Date() - 2_800
                    ),
                    MessageViewModel(
                        senderId: "id-valerian",
                        senderName: "Valerian",
                        avatar: PreviewImages.Avatars.valerian.rawValue,
                        content: "Okay, I see. Thanks. I will contact them whenever they get back online. 🤯",
                        timestamp: Date() - 3_000
                    ),
                ]),
                (ChatID.person(id: "id-julien"), [
                    MessageViewModel(
                        senderId: "id-baptiste",
                        senderName: "Baptiste",
                        avatar: PreviewImages.Avatars.baptiste.rawValue,
                        content: "Can I initiate a deployment of the Vue app?",
                        timestamp: Date() - 9_000
                    ),
                    MessageViewModel(
                        senderId: "id-julien",
                        senderName: "Julien",
                        avatar: PreviewImages.Avatars.julien.rawValue,
                        content: "Yes, it's ready. 3 new features are shipping! 😀",
                        timestamp: Date() - 10_000
                    ),
                ]),
                (ChatID.group(id: "constellation"), [
                    MessageViewModel(
                        senderId: "id-baptiste",
                        senderName: "Baptiste",
                        avatar: PreviewImages.Avatars.baptiste.rawValue,
                        content: "⚠️ I'm performing a change of the server IP definitions. Slight outage espected.",
                        timestamp: Date() - 90_000
                    ),
                    MessageViewModel(
                        senderId: "id-constellation-health",
                        senderName: "constellation-health",
                        avatar: PreviewImages.Avatars.constellationHealth.rawValue,
                        content: "🆘 socket-1.sgp.atlas.net.crisp.chat - Got HTTP status: \"503 or invalid body\"",
                        timestamp: Date() - 100_000
                    ),
                ]))))
            UnreadScreen(model: .init(messages: .init()))
        }
    }

    static var previews: some View {
        Preview()
            .preferredColorScheme(.light)
            .previewDisplayName("Light")

        Preview()
            .preferredColorScheme(.dark)
            .previewDisplayName("Dark")
    }
}
=======
//struct UnreadScreen_Previews: PreviewProvider {
//
//    private struct Preview: View {
//        
//        var body: some View {
//            UnreadScreen(model: .init(messages: OrderedDictionary(dictionaryLiteral:
//                (ChatID.person(id: PreviewJIDs.valerian.rawValue), [
//                    MessageViewModel(
//                        senderId: PreviewJIDs.baptiste.rawValue,
//                        senderName: "Baptiste",
//                        avatar: PreviewImages.Avatars.baptiste.rawValue,
//                        content: "They forgot to ship the package.",
//                        timestamp: Date() - 2_800
//                    ),
//                    MessageViewModel(
//                        senderId: PreviewJIDs.valerian.rawValue,
//                        senderName: "Valerian",
//                        avatar: PreviewImages.Avatars.valerian.rawValue,
//                        content: "Okay, I see. Thanks. I will contact them whenever they get back online. 🤯",
//                        timestamp: Date() - 3_000
//                    ),
//                ]),
//                (ChatID.person(id: PreviewJIDs.julien.rawValue), [
//                    MessageViewModel(
//                        senderId: PreviewJIDs.baptiste.rawValue,
//                        senderName: "Baptiste",
//                        avatar: PreviewImages.Avatars.baptiste.rawValue,
//                        content: "Can I initiate a deployment of the Vue app?",
//                        timestamp: Date() - 9_000
//                    ),
//                    MessageViewModel(
//                        senderId: PreviewJIDs.julien.rawValue,
//                        senderName: "Julien",
//                        avatar: PreviewImages.Avatars.julien.rawValue,
//                        content: "Yes, it's ready. 3 new features are shipping! 😀",
//                        timestamp: Date() - 10_000
//                    ),
//                ]),
//                (ChatID.group(id: "constellation"), [
//                    MessageViewModel(
//                        senderId: PreviewJIDs.baptiste.rawValue,
//                        senderName: "Baptiste",
//                        avatar: PreviewImages.Avatars.baptiste.rawValue,
//                        content: "⚠️ I'm performing a change of the server IP definitions. Slight outage espected.",
//                        timestamp: Date() - 90_000
//                    ),
//                    MessageViewModel(
//                        senderId: PreviewJIDs.constellationHealth.rawValue,
//                        senderName: "constellation-health",
//                        avatar: PreviewImages.Avatars.constellationHealth.rawValue,
//                        content: "🆘 socket-1.sgp.atlas.net.crisp.chat - Got HTTP status: \"503 or invalid body\"",
//                        timestamp: Date() - 100_000
//                    ),
//                ])
//            )))
//            UnreadScreen(model: .init(messages: .init()))
//        }
//        
//    }
//
//    static var previews: some View {
//        Preview()
//            .preferredColorScheme(.light)
//            .previewDisplayName("Light")
//
//        Preview()
//            .preferredColorScheme(.dark)
//            .previewDisplayName("Dark")
//    }
//
//}
>>>>>>> Stashed changes:Prose/Prose/Components/Content/Spotlight/Unread/UnreadScreen.swift
