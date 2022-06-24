//
//  Authentication+TemporaryFix.swift
//  Prose
//
//  Created by Rémi Bardon on 09/06/2022.
//

import AppLocalization
import Foundation

public enum MFAError: Error, Equatable {
    case badCode
}

extension MFAError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .badCode:
            return "Bad code"
        }
    }
}
