//
//  NavigationDestinationView.swift
//  Prose
//
//  Created by Valerian Saliou on 11/15/21.
//

import AddressBookFeature
import ComposableArchitecture
import ConversationFeature
import ProseUI
import SwiftUI
import UnreadFeature

// MARK: - View

/// The view displayed in the middle of the screen when a row is selected in the left sidebar.
///
/// - TODO: Migrate to TCA once `ConversationScreen` supports it.
struct NavigationDestinationView: View {
    let selection: Route?

    var body: some View {
<<<<<<< Updated upstream:Prose/ProseLib/Sources/SidebarFeature/NavigationDestinationView.swift
        content()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("")
=======
        ZStack {
            Color.backgroundMessage
            content()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle("")
        .toolbar {
            Toolbar(selection: selection)
        }
>>>>>>> Stashed changes:Prose/Prose/Views/Common/ContentView.swift
    }

    @ViewBuilder
    private func content() -> some View {
<<<<<<< Updated upstream:Prose/ProseLib/Sources/SidebarFeature/NavigationDestinationView.swift
        switch self.selection {
        case let .chat(id):
            ConversationScreen(store: Store(
                initialState: ConversationState(chatId: id),
                reducer: conversationReducer,
                environment: ConversationEnvironment()
            ))
        case .unread:
            UnreadScreen(model: .init(
                messages: MessageStore.shared.unreadMessages().mapValues { $0.map(\.toMessageViewModel) }
            ))
            .groupBoxStyle(.spotlight)
        case .peopleAndGroups:
            AddressBookScreen()
=======
        switch selection {
        case .chat(let jid):
            ConversationScreen(jid: jid)
        case .unread:
            UnreadScreen()
>>>>>>> Stashed changes:Prose/Prose/Views/Common/ContentView.swift
        case .none:
            Text("No selection 🤷")
        case let .some(value):
            Text("\(String(describing: value)) (not supported yet)")
                .toolbar(content: CommonToolbar.init)
        }
    }
}

// MARK: - Previews

struct NavigationDestinationView_Previews: PreviewProvider {
    static var previews: some View {
<<<<<<< Updated upstream:Prose/ProseLib/Sources/SidebarFeature/NavigationDestinationView.swift
        NavigationDestinationView(selection: .chat(id: .person(id: "id-valerian")))
=======
        ContentView(selection: .chat(jid: PreviewJIDs.valerian.rawValue))
>>>>>>> Stashed changes:Prose/Prose/Views/Common/ContentView.swift
    }
}
