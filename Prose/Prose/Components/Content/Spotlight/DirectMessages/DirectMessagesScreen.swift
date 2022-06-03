//
//  DirectMessagesScreen.swift
//  Prose
//
//  Created by Rémi Bardon on 28/03/2022.
//  Copyright © 2022 Prose. All rights reserved.
//

import OrderedCollections
import Persistence
import SwiftUI

struct DirectMessagesScreen: View {
    // FIXME: Filter on chatId
    @SectionedFetchRequest(
        sectionIdentifier: \MessageEntity.date,
        sortDescriptors: [
            SortDescriptor(\MessageEntity.timestamp),
        ],
        predicate: MessageEntity.isReadPredicate(false)
    )
    private var messages
    
    var body: some View {
        content()
            .background(Color.backgroundMessage)
    }
    
    @ViewBuilder
    private func content() -> some View {
        if messages.isEmpty {
            nothing()
        } else {
            list()
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
                ForEach(messages) { (section) in
                    DirectMessagesSection(
                        date: section.first![keyPath: messages.sectionIdentifier],
                        messages: section.map(\.toMessageViewModel)
                    )
                }
            }
            .padding(24)
        }
    }
}

struct DirectMessagesScreen_Previews: PreviewProvider {
    
    private struct Preview: View {
        
        var body: some View {
            // TODO: Add preview
            Text("TODO")
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
