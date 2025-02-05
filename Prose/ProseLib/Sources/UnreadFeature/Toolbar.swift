//
// This file is part of prose-app-macos.
// Copyright (c) 2022 Prose Foundation
//

import ProseUI
import SwiftUI

// MARK: - View

struct Toolbar: ToolbarContent {
  @Environment(\.redactionReasons) private var redactionReasons

  var body: some ToolbarContent {
    ToolbarItemGroup(placement: .navigation) {
      CommonToolbarNavigation()
    }
    ToolbarItemGroup {
      Self.actions(redactionReasons: self.redactionReasons)
      ToolbarDivider()
      CommonToolbarActions()
    }
  }

  @ViewBuilder
  static func actions(redactionReasons: RedactionReasons) -> some View {
    Button { logger.info("Mark as read tapped") } label: {
      Label("Mark as read", systemImage: "envelope.open")
    }
    .unredacted()
    .disabled(redactionReasons.contains(.placeholder))
    // https://github.com/prose-im/prose-app-macos/issues/48
    .disabled(true)

    ToolbarDivider()

    Menu {
      // TODO: Add actions
      Text("TODO")
    } label: {
      Label("Filter", systemImage: "line.3.horizontal.decrease.circle")
    }
    .unredacted()
    .disabled(redactionReasons.contains(.placeholder))
    // https://github.com/prose-im/prose-app-macos/issues/48
    .disabled(true)
  }
}

// MARK: - Previews

internal struct Toolbar_Previews: PreviewProvider {
  private struct Preview: View {
    @Environment(\.redactionReasons) private var redactionReasons

    var body: some View {
      HStack {
        Toolbar.actions(redactionReasons: redactionReasons)
      }
      .padding()
      .previewLayout(.sizeThatFits)
    }
  }

  static var previews: some View {
    Preview()
    Preview()
      .redacted(reason: .placeholder)
      .previewDisplayName("Placeholder")
  }
}
