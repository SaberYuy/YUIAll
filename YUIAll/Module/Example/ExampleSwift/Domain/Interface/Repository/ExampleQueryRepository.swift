//
//  ExampleQueryRepository.swift
//  YUIAll
//
//  Created by SPDBVIP453 on 2023/2/16.
//

import Foundation

protocol ExampleQueryRepository {
    func fetchRecentQuery(maxCount: Int, completion: @escaping (Result<[ExampleQuery], Error>) -> Void)
    func saveRecentQuery(query: ExampleQuery, completion: @escaping (Result<[ExampleQuery], Error>) -> Void)
}
