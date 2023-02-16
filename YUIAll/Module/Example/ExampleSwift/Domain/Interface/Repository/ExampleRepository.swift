//
//  ExampleRepository.swift
//  YUIAll
//
//  Created by SPDBVIP453 on 2023/2/16.
//

import Foundation

protocol ExampleRepository {
    @discardableResult
    func fetchExampleList(query: ExampleQuery,
                          page: Int,
                          cached: @escaping (ExamplePage) -> Void,
                          completion: @escaping (Result<ExamplePage, Error>) -> Void) -> Cancellable?
}
