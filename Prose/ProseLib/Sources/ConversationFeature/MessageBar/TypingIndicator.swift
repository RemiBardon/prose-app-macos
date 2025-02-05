//
// This file is part of prose-app-macos.
// Copyright (c) 2022 Prose Foundation
//

import AppLocalization
import Assets
import ProseCoreTCA
import SwiftUI

private let l10n = L10n.Content.MessageBar.self

public enum Name: Equatable {
  case jid(JID), displayName(String)

  var displayName: String {
    switch self {
    case let .jid(jid):
      let name: String = (jid.node ?? jid.domain)
      return name
        .split(separator: ".", omittingEmptySubsequences: true)
        .joined(separator: " ")
        .localizedCapitalized
    case let .displayName(displayName):
      return displayName
    }
  }
}

struct TypingIndicator: View {
  static let cornerRadius: CGFloat = 12
  static let fontSize: CGFloat = 10
  static let font: NSFont = .systemFont(ofSize: Self.fontSize, weight: .light)
  static let horizontalPadding = Self.cornerRadius
  static let verticalPadding = 2 * (Self.cornerRadius - Self.fontSize)

  var typingUsers: [String]

  init(typingUsers: [Name]) {
    self.typingUsers = typingUsers.map(\.displayName)
  }

  var body: some View {
    if !self.typingUsers.isEmpty {
      GeometryReader { geo in
        ZStack {
          Text(verbatim: self.text(fitting: geo.size.width - 2 * Self.horizontalPadding))
            .font(Font(Self.font))
            .lineLimit(1)
            .padding(.vertical, Self.verticalPadding)
            .padding(.horizontal, Self.horizontalPadding)
            .foregroundColor(Colors.Text.secondary.color)
            .background(
              ZStack {
                RoundedRectangle(cornerRadius: Self.cornerRadius)
                  .fill(.background)
                RoundedRectangle(cornerRadius: Self.cornerRadius)
                  .strokeBorder(Colors.Border.tertiary.color)
              }
            )
            .compositingGroup()
            .shadow(color: .black.opacity(0.0625), radius: 2, y: 1)
            .frame(maxWidth: geo.size.width, alignment: .leading)
            .fixedSize(horizontal: false, vertical: true)
        }
        .frame(width: geo.size.width, height: geo.size.height, alignment: .bottom)
      }
      // Align the bottom of the typing indicator to the alignment guide, with a little offset
      .alignmentGuide(.typingIndicator) { $0[VerticalAlignment.bottom] - Self.cornerRadius + 1 }
    }
  }

  /// - Returns: The longest text fitting in one line.
  /// - Note: It has been decided to show maximum 2 names.
  /// - Note: With reasonable window sizes, the case where nothing can fit in a single line
  ///         should never happen. However, we can return the smallest text
  ///         and rely on `.lineLimit(1)` and truncation to display as mush as possible.
  func text(fitting maxWidth: CGFloat) -> String {
    var maxNames = 2
    var text: String
    var bounds: CGSize
    repeat {
      text = Self.text(for: self.typingUsers, maxNames: maxNames)
      bounds = boundingRect(
        for: text,
        withFont: Self.font,
        in: CGSize(width: CGFloat.infinity, height: 0)
      )
      maxNames -= 1
    } while maxNames > 0 && bounds.width > maxWidth
    return text
  }

  static func text(for names: [String], maxNames: Int) -> String {
    if names.isEmpty { return "" }
    var components = names.prefix(maxNames)
    let others = names.dropFirst(maxNames)
    if !others.isEmpty {
      components.append(l10n.others(others.count))
    }
    return [
      components.formatted(.list(type: .and)),
      l10n.typing(names.count),
    ].joined(separator: " ")
  }
}

private func boundingRect(for text: String, withFont font: NSFont, in size: CGSize) -> CGSize {
  let attributes: [NSAttributedString.Key: Any] = [.font: font]
  let attributedString = NSAttributedString(string: text, attributes: attributes)
  return attributedString.boundingRect(with: size, options: [.usesLineFragmentOrigin]).size
}

private struct TypingIndicatorAlignment: AlignmentID {
  static func defaultValue(in context: ViewDimensions) -> CGFloat {
    // Align the typing indicator to the top of the view
    context[VerticalAlignment.top]
  }
}

private extension VerticalAlignment {
  static let typingIndicator: Self = .init(TypingIndicatorAlignment.self)
}

extension Alignment {
  // Align the typing indicator to the leading edge of the view
  static let typingIndicator: Self = .init(horizontal: .leading, vertical: .typingIndicator)
}

#if DEBUG
  struct TypingIndicator_Previews: PreviewProvider {
    private struct Preview: View {
      let typingUsers: [Name]
      let name: String
      var height: CGFloat = 48
      var border: Bool = false
      var body: some View {
        VStack(spacing: 0) {
          VStack(alignment: .leading) {
            ZStack {
              RoundedRectangle(cornerRadius: 8)
                .fill(.background)
              RoundedRectangle(cornerRadius: 8)
                .strokeBorder(.separator)
            }
            .frame(height: self.height)
            .overlay(alignment: .typingIndicator) {
              TypingIndicator(typingUsers: self.typingUsers)
                .border(self.border ? Color.red.opacity(0.5) : .clear)
                .padding(.horizontal, 8)
            }
            Text(verbatim: self.name)
              .font(.headline)
          }
          .padding()
        }
        Divider()
      }
    }

    static let jids: [JID] = [
      "marc.preview@prose.org", "remi.preview@prose.org", "valerian.preview@prose.org",
      "marc.other@prose.org", "remi.other@prose.org",
      "preview@prose.org", "bot1@prose.org", "bot2@prose.org", "bot3@prose.org",
    ]
    static let allUsers: [Name] = Self.jids.map(Name.jid)
    static let displayNames: [Name] = ["Rémi"].map(Name.displayName)
    static func users(_ count: Int) -> [Name] {
      Array(Self.allUsers.prefix(count))
    }

    static var previews: some View {
      let previews = VStack(alignment: .leading, spacing: 0) {
        Group {
          Preview(typingUsers: [], name: "Empty list")
          Preview(typingUsers: Self.users(1), name: "Single name")
          Preview(typingUsers: Self.users(2), name: "Two names")
          Preview(typingUsers: Self.users(3), name: "Three names")
          Preview(typingUsers: Self.users(4), name: "Four names")
          Preview(typingUsers: Self.users(5), name: "Five names")
          Preview(typingUsers: Self.allUsers, name: "More names")
        }
        Group {
          Preview(typingUsers: Self.users(5), name: "Five names medium width")
            .frame(width: 400)
          Preview(typingUsers: Self.users(5), name: "Five names small width")
            .frame(width: 300)
          Preview(typingUsers: Self.users(5), name: "Five names tiny width")
            .frame(width: 120)
        }
        Group {
          Preview(typingUsers: Self.displayNames, name: "With small field", height: 10)
          Preview(typingUsers: Self.displayNames, name: "With border", border: true)
          Preview(typingUsers: Self.displayNames, name: "With diacritics")
          Preview(typingUsers: Self.displayNames, name: "Colorful background")
            .background(Color.purple)
        }
      }
      .frame(width: 500)
      .fixedSize()

      previews
        .preferredColorScheme(.light)
        .previewDisplayName("Light")
      previews
        .preferredColorScheme(.dark)
        .previewDisplayName("Dark")
    }
  }
#endif
