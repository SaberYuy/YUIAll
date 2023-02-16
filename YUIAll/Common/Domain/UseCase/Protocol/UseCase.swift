//
//  UseCase.swift
//  YUIAll
//
//  Created by SPDBVIP453 on 2023/2/16.
//

import Foundation

public protocol UseCase {
    @discardableResult
    func start() -> Cancellable?
}
