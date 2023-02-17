//
//  ExampleSwiftRepository.swift
//  YUIAll
//
//  Created by SPDBVIP453 on 2023/2/16.
//

import Foundation

protocol ExampleSwiftRepository {
    @discardableResult
    func fetchExampleSwiftList(query: ExampleSwiftQuery,
                          page: Int,
                          cached: @escaping (ExampleSwiftPage) -> Void,
                          completion: @escaping (Result<ExampleSwiftPage, Error>) -> Void) -> Cancellable?
}
