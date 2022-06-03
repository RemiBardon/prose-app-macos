//
//  DirectMessagesSection.swift
//  Prose
//
//  Created by Rémi Bardon on 28/03/2022.
//  Copyright © 2022 Prose. All rights reserved.
//

import SwiftUI

struct DirectMessagesSection: View {
    let date: Date
    let messages: [MessageViewModel]
    
    var body: some View {
        GroupBox {
            HStack {
                VStack {
                    ForEach(messages, content: MessageView.init(model:))
                }
                VStack {
                    Button {
                        print("Open tapped")
                    } label: {
                        // FIXME: Localize
                        Label("Reply", systemImage: "arrow.uturn.right")
                            .frame(maxWidth: .infinity)
                    }
                    .foregroundColor(.accentColor)
                }
                .frame(width: 96)
                .labelStyle(.vertical)
                .buttonStyle(.shadowed)
            }
        } label: {
            HStack {
                Text(messages.last!.timestamp, format: .relative(presentation: .named))
                    .font(.title3.bold())
                Spacer()
                // FIXME: Localize
                Text("\(messages.count) interactions")
                    .foregroundColor(.secondary)
            }
        }
        .groupBoxStyle(.spotlight)
    }
}

struct DirectMessagesSection_Previews: PreviewProvider {
    static var previews: some View {
        DirectMessagesSection(
            date: Calendar.current.startOfDay(for: .now),
            messages: [
                .init(
                    senderId: PreviewJIDs.valerian.rawValue,
                    senderName: "Valerian",
                    avatar: PreviewImages.Avatars.valerian.rawValue,
                    content: "Some message",
                    timestamp: .now
                ),
            ]
        )
    }
}
