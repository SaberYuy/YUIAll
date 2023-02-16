//
//  FetchRecentExampleQueryUseCase.swift
//  YUIAll
//
//  Created by SPDBVIP453 on 2023/2/16.
//

import Foundation

// This is another option to create Use Case using more generic way
final class FetchRecentExampQueryUseCase: UseCase {
    
    struct RequestValue {
        let maxCount: Int
    }
    typealias ResultValue = (Result<[ExampleQuery], Error>)
    
    private let requestValue: RequestValue
    private let completion: (ResultValue) -> Void
    private let exampleQueryRepository: ExampleQueryRepository
    
    init(requestValue: RequestValue,
         completion: @escaping (ResultValue) -> Void,
         exampleQueryRepository: ExampleQueryRepository) {
        
        self.requestValue = requestValue
        self.completion = completion
        self.exampleQueryRepository = exampleQueryRepository
    }
    
    func start() -> Cancellable? {
        
        exampleQueryRepository.fetchRecentQuery(maxCount: requestValue.maxCount, completion: completion)
        return nil
    }
}
