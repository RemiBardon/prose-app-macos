//
// This file is part of prose-app-macos.
// Copyright (c) 2022 Prose Foundation
//

import SwiftUI

struct ThreeColumns<Column1: View, Column2: View, Column3: View>: View {
  let label: String
  let column1: Column1
  let column2: Column2
  let column3: Column3

  init(
    label: String,
    @ViewBuilder column1: () -> Column1,
    @ViewBuilder column2: () -> Column2,
    @ViewBuilder column3: () -> Column3
  ) {
    self.label = label
    self.column1 = column1()
    self.column2 = column2()
    self.column3 = column3()
  }

  init(
    _ label: String,
    @ViewBuilder column2: () -> Column2,
    @ViewBuilder column3: () -> Column3
  ) where Column1 == Text {
    self.label = label
    self.column1 = Text(verbatim: label)
    self.column2 = column2()
    self.column3 = column3()
  }

  /// - Note: `AnyView(Color.clear.fixedSize())` allows SwiftUI to keep some space for views.
  ///         If we were using `EmptyView`, the second column (of a ``ThreeColumns<_, _, EmptyView>``)
  ///         would span all the way until the trailing edge, which is not what we want.
  init(
    _ label: String,
    @ViewBuilder column2: () -> Column2
  ) where Column1 == Text, Column3 == AnyView {
    self.label = label
    self.column1 = Text(verbatim: label)
    self.column2 = column2()
    self.column3 = AnyView(Color.clear.fixedSize())
  }

  var body: some View {
    HStack {
      column1
        .font(.headline.weight(.medium))
        .frame(width: 96, alignment: .leading)
        // Ignore as it's already the container label
        .accessibilityHidden(true)
      column2
        .frame(maxWidth: .infinity, alignment: .leading)
      column3
        .font(.headline.weight(.medium))
        .frame(width: 96, alignment: .leading)
    }
    .accessibilityElement(children: .contain)
    .accessibilityLabel(self.label)
  }
}

struct ThreeColumns_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      ThreeColumns("First name:") {
        TextField(text: .constant("Baptiste"), label: { Text("Label") })
          .textFieldStyle(.roundedBorder)
          .controlSize(.large)
      } column3: {
        Button {} label: {
          Text("Get verified")
        }
        .buttonStyle(.plain)
        .foregroundColor(.accentColor)
      }
      ThreeColumns("Password:") {
        Button {} label: {
          Text("Change password…")
            .frame(maxWidth: .infinity)
        }
        .controlSize(.large)
      }
      ThreeColumns("Auto-detect:") {
        Toggle(isOn: .constant(true), label: { Text("Label") })
          .toggleStyle(.switch)
          .labelsHidden()
      }
    }
    .padding()
  }
}
