//
//  FavoritesSection.swift
//  Prose
//
//  Created by Valerian Saliou on 11/28/21.
//

import AppLocalization
import ComposableArchitecture
import PreviewAssets
import SwiftUI

<<<<<<< Updated upstream:Prose/ProseLib/Sources/SidebarFeature/Sections/FavoritesSection.swift
private let l10n = L10n.Sidebar.Favorites.self

// MARK: - View

struct FavoritesSection: View {
    typealias State = FavoritesSectionState
    typealias Action = FavoritesSectionAction

    let store: Store<State, Action>
    private var actions: ViewStore<Void, Action> { ViewStore(self.store.stateless) }

    @Binding var route: Route?

    var body: some View {
        Section(l10n.title) {
            WithViewStore(self.store.scope(state: \State.items)) { items in
                ForEach(items.state) { item in
                    NavigationLink(tag: item.id, selection: $route) {
                        NavigationDestinationView(selection: item.id)
=======
extension SidebarView {
    
    struct FavoritesSection: View {
        
        @Binding var selection: SidebarID?
        
        let items: [SidebarOption] = [
            .init(
                id: .chat(jid: PreviewJIDs.valerian.rawValue),
                title: "Valerian",
                image: PreviewImages.Avatars.valerian.rawValue,
                count: 0
            ),
            .init(
                id: .chat(jid: PreviewJIDs.alexandre.rawValue),
                title: "Alexandre",
                image: PreviewImages.Avatars.alexandre.rawValue,
                count: 0
            ),
        ]
        
        var body: some View {
            Section("sidebar_section_favorites".localized()) {
                ForEach(items) { item in
                    NavigationLink(tag: item.id, selection: $selection) {
                        ContentView(selection: item.id)
>>>>>>> Stashed changes:Prose/Prose/Components/Sidebar/Sections/Sidebar+FavoritesSection.swift
                    } label: {
                        ContactRow(
                            title: item.title,
                            avatar: item.image,
                            count: item.count
                        )
                    }
                }
            }
        }
    }
}

// MARK: - The Composable Architecture

// MARK: Reducer

let favoritesSectionReducer: Reducer<
    FavoritesSectionState,
    FavoritesSectionAction,
    Void
> = Reducer.empty

// MARK: State

public struct FavoritesSectionState: Equatable {
    let items: [SidebarItem] = [
        .init(
            id: .chat(id: .person(id: "id-valerian")),
            title: "Valerian",
            image: PreviewImages.Avatars.valerian.rawValue,
            count: 0
        ),
        .init(
            id: .chat(id: .person(id: "id-alexandre")),
            title: "Alexandre",
            image: PreviewImages.Avatars.alexandre.rawValue,
            count: 0
        ),
    ]

    public init() {}
}

// MARK: Actions

public enum FavoritesSectionAction: Equatable {}

// MARK: - Previews

internal struct FavoritesSection_Previews: PreviewProvider {
    private struct Preview: View {
        @State var route: Route?

        var body: some View {
            NavigationView {
                List {
                    FavoritesSection(
                        store: Store(
                            initialState: .init(),
                            reducer: favoritesSectionReducer,
                            environment: ()
                        ),
                        route: $route
                    )
                }
                .frame(width: 256)
            }
        }
    }

    static var previews: some View {
        Preview(route: nil)
    }
}
