//
//  DataTransferError+ConnectionError.swift
//  YUIAll
//
//  Created by YUI on 29.10.19.
//

import Foundation

extension DataTransferError: ConnectionError {
    public var isInternetConnectionError: Bool {
        guard case let DataTransferError.networkFailure(networkError) = self,
            case .notConnected = networkError else {
                return false
        }
        return true
    }
}
