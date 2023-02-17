//
//  FetchRecentExampleSwiftQueryUseCase.swift
//  YUIAll
//
//  Created by SPDBVIP453 on 2023/2/16.
//

import Foundation

// This is another option to create Use Case using more generic way
final class FetchRecentExampleSwiftQueryUseCase: UseCase {
    
    struct RequestValue {
        let maxCount: Int
    }
    typealias ResultValue = (Result<[ExampleSwiftQuery], Error>)
    
    private let requestValue: RequestValue
    private let completion: (ResultValue) -> Void
    private let exampleSwiftQueryRepository: ExampleSwiftQueryRepository
    
    init(requestValue: RequestValue,
         completion: @escaping (ResultValue) -> Void,
         exampleSwiftQueryRepository: ExampleSwiftQueryRepository) {
        
        self.requestValue = requestValue
        self.completion = completion
        self.exampleSwiftQueryRepository = exampleSwiftQueryRepository
    }
    
    func start() -> Cancellable? {
        
        exampleSwiftQueryRepository.fetchRecentQuery(maxCount: requestValue.maxCount, completion: completion)
        return nil
    }
}
