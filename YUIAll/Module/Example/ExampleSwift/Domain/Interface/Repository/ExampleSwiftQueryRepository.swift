//
//  ExampleSwiftQueryRepository.swift
//  YUIAll
//
//  Created by SPDBVIP453 on 2023/2/16.
//

import Foundation

protocol ExampleSwiftQueryRepository {
    func fetchRecentQuery(maxCount: Int, completion: @escaping (Result<[ExampleSwiftQuery], Error>) -> Void)
    func saveRecentQuery(query: ExampleSwiftQuery, completion: @escaping (Result<[ExampleSwiftQuery], Error>) -> Void)
}
