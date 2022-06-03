//
//  ConversationInfoView.swift
//  Prose
//
//  Created by Valerian Saliou on 11/23/21.
//

<<<<<<< Updated upstream:Prose/ProseLib/Sources/ConversationFeature/ConversationInfo/ConversationInfoView.swift
import ComposableArchitecture
=======
import Persistence
>>>>>>> Stashed changes:Prose/Prose/Views/Message/ConversationDetailsView.swift
import SwiftUI

// MARK: - View

struct ConversationInfoView: View {
    struct SectionGroupStyle: GroupBoxStyle {
        private static let sidesPadding: CGFloat = 15

        func makeBody(configuration: Configuration) -> some View {
            VStack(spacing: 8) {
                VStack(alignment: .leading, spacing: 2) {
                    configuration.label
                        .font(.system(size: 11, weight: .semibold))
                        .foregroundColor(Color.primary.opacity(0.25))
                        .padding(.horizontal, Self.sidesPadding)
                        .unredacted()

                    Divider()
                }

                configuration.content
                    .padding(.horizontal, Self.sidesPadding)
            }
        }
    }
<<<<<<< Updated upstream:Prose/ProseLib/Sources/ConversationFeature/ConversationInfo/ConversationInfoView.swift

    typealias State = ConversationInfoState
    typealias Action = ConversationInfoAction

    let store: Store<State, Action>
    private var actions: ViewStore<Void, Action> { ViewStore(self.store.stateless) }

=======
    
    @FetchRequest private var users: FetchedResults<UserEntity>
    
    var user: UserEntity? { users.first }
    
    init(jid: JID) {
        self._users = FetchRequest<UserEntity>(
            sortDescriptors: [],
            predicate: UserEntity.jidPredicate(jid)
        )
    }
    
>>>>>>> Stashed changes:Prose/Prose/Views/Message/ConversationDetailsView.swift
    var body: some View {
        if let user = self.user {
            content(user: user)
        }
    }
    
    @ViewBuilder
    private func content(user: UserEntity) -> some View {
        ScrollView(.vertical) {
<<<<<<< Updated upstream:Prose/ProseLib/Sources/ConversationFeature/ConversationInfo/ConversationInfoView.swift
=======
            VStack(spacing: 12) {
                IdentitySection(
                    avatar: user.avatar!,
                    name: user.displayName!
                )
                QuickActionsSection()
            }
            .padding()
            .frame(maxWidth: .infinity)
            
>>>>>>> Stashed changes:Prose/Prose/Views/Message/ConversationDetailsView.swift
            VStack(spacing: 24) {
                VStack(spacing: 12) {
                    WithViewStore(self.store) { viewStore in
                        IdentitySection(
                            avatar: viewStore.user.avatar,
                            name: viewStore.user.fullName
                        )
                    }
                    QuickActionsSection()
                }
                .padding(.horizontal)

                InformationSection()
                SecuritySection()
                ActionsSection()
            }
            .padding(.vertical)
        }
        .groupBoxStyle(SectionGroupStyle())
        .background(.background)
    }
}

// MARK: - The Composable Architecture

// MARK: Reducer

public let conversationInfoReducer: Reducer<
    ConversationInfoState,
    ConversationInfoAction,
    Void
> = Reducer.empty

// MARK: State

public struct ConversationInfoState: Equatable {
    let user: User

    public init(
        user: User
    ) {
        self.user = user
    }
}

// MARK: Actions

public enum ConversationInfoAction: Equatable {}

// MARK: - Previews

#if DEBUG
    import PreviewAssets
#endif

internal struct ConversationInfoView_Previews: PreviewProvider {
    private struct Preview: View {
        var body: some View {
            ConversationInfoView(store: Store(
                initialState: ConversationInfoState(
                    user: .init(
                        userId: "valerian@prose.org",
                        displayName: "Valerian",
                        fullName: "valerian Saliou",
                        avatar: PreviewImages.Avatars.valerian.rawValue
                    )
                ),
                reducer: conversationInfoReducer,
                environment: ()
            ))
            .frame(width: 220, height: 720)
        }
    }

    static var previews: some View {
<<<<<<< Updated upstream:Prose/ProseLib/Sources/ConversationFeature/ConversationInfo/ConversationInfoView.swift
        Preview()
            .previewDisplayName("Normal")
        Preview()
            .previewDisplayName("Placeholder")
=======
        ConversationDetailsView(
            jid: PreviewJIDs.valerian.rawValue
        )
            .frame(width: 220.0, height: 720, alignment: .top)
>>>>>>> Stashed changes:Prose/Prose/Views/Message/ConversationDetailsView.swift
    }
}
