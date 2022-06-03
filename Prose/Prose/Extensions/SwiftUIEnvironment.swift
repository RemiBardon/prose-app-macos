//
//  SwiftUIEnvironment.swift
//  Prose
//
//  Created by Rémi Bardon on 27/03/2022.
//  Copyright © 2022 Prose. All rights reserved.
//

import Foundation
import OSLog
import Persistence
import SwiftUI

fileprivate let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "swiftui-environment")

fileprivate struct StorageProviderKey: EnvironmentKey {
    static let defaultValue: StorageProvider = .preview
}

extension EnvironmentValues {
    var storageProvider: StorageProvider {
        get { self[StorageProviderKey.self] }
        set {
            logger.trace("Updating `storageProvider` to \(newValue.container.description)…")
            self[StorageProviderKey.self] = newValue
            self.managedObjectContext = newValue.container.viewContext
        }
    }
}

#warning("This should not be stored here, but rather in the Keychain")
fileprivate struct JIDKey: EnvironmentKey {
    static let defaultValue: JID = PreviewJIDs.baptiste.rawValue
}

extension EnvironmentValues {
    var jid: JID {
        get { self[JIDKey.self] }
        set {
            logger.trace("Updating `jid` to \(newValue)…")
            self[JIDKey.self] = newValue
        }
    }
}
