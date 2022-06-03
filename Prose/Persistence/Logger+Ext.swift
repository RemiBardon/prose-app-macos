//
//  Logger+Ext.swift
//  Persistence
//
//  Created by Rémi Bardon on 02/07/2021.
//  Copyright © 2022 Prose. All rights reserved.
//

import OSLog

extension Logger {
    
    internal static let subsystem = Bundle.main.bundleIdentifier!
    // swiftlint:disable:previous force_unwrapping
    
    /// Logs persisted data reads and writes.
    internal static let persistence = Logger(subsystem: subsystem, category: "persistence")
    
}
