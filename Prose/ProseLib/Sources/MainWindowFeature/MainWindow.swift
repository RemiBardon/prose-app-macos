//
//  MainWindow.swift
//  Prose
//
//  Created by Rémi Bardon on 01/06/2022.
//

import ComposableArchitecture
import SidebarFeature
import SwiftUI
import TcaHelpers

// swiftlint:disable file_types_order

// MARK: - View

public struct MainWindow: View {
    public typealias State = MainWindowState
    public typealias Action = MainWindowAction

    private let store: Store<State, Action>
    private var actions: ViewStore<Void, Action> { ViewStore(self.store.stateless) }

    // swiftlint:disable:next type_contents_order
    public init(store: Store<State, Action>) {
        self.store = store
    }

    public var body: some View {
        NavigationView {
            // NOTE: [Rémi Bardon] For some reason, using `\State.sidebar` causes
            //       `Key path value type 'SidebarState' cannot be converted to contextual type
            //       'SidebarView.State' (aka 'SidebarState')`. We need to omit `State`.
            SidebarView(store: self.store.scope(state: \.sidebar, action: Action.sidebar))
                .frame(minWidth: 280)
            Text("Nothing to show here 🤷")
        }
        .listStyle(.sidebar)
    }
}

// MARK: - The Composabe Architecture

// MARK: Reducer

private let mainWindowCoreReducer: Reducer<
    MainWindowState,
    MainWindowAction,
    MainWindowEnvironment
> = Reducer { _, action, _ in
    switch action {
    case .sidebar:
        break
    }

    return .none
}

public let mainWindowReducer: Reducer<
    MainWindowState,
    MainWindowAction,
    MainWindowEnvironment
> = Reducer.combine([
    sidebarReducer._pullback(
        state: \MainWindowState.sidebar,
        action: /MainWindowAction.sidebar,
        environment: \MainWindowEnvironment.sidebar
    ),
    mainWindowCoreReducer,
])

// MARK: State

public struct MainWindowState: Equatable {
    public var sidebar: SidebarState

    public init(
        sidebar: SidebarState
    ) {
        self.sidebar = sidebar
    }
}

// MARK: Actions

public enum MainWindowAction: Equatable {
    case sidebar(SidebarAction)
}

// MARK: Environment

public struct MainWindowEnvironment: Equatable {
    public var sidebar: SidebarEnvironment

    public init(
        sidebar: SidebarEnvironment = .init()
    ) {
        self.sidebar = sidebar
    }
}

// MARK: - Previews

internal struct MainWindow_Previews: PreviewProvider {
    static var previews: some View {
        MainWindow(store: Store(
            initialState: MainWindowState(
                sidebar: .init(credentials: UserCredentials(jid: "preview@prose.org"))
            ),
            reducer: mainWindowReducer,
            environment: MainWindowEnvironment()
        ))
    }
}
