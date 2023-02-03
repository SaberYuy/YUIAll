//
//  ConnectionError.swift
//  YUIAll
//
//  Created by SPDBVIP453 on 2023/2/3.
//

import Foundation

public protocol ConnectionError {
    
    var internetConnectionError: Bool { get }
}

public extension Error {
    
    var internetConnectionError: Bool {
        
        guard let error = self as? ConnectionError, error.internetConnectionError else {
            return false
        }
        return true
    }
}
