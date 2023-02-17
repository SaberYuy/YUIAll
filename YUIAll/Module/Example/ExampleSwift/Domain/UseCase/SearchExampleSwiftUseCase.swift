//
//  SearchExampleSwiftUseCase.swift
//  YUIAll
//
//  Created by SPDBVIP453 on 2023/2/16.
//

import Foundation

protocol SearchExampleSwiftUseCase {
    func execute(requestValue: SearchExampleSwiftUseCaseRequestValue,
                 cached: @escaping (ExampleSwiftPage) -> Void,
                 completion: @escaping (Result<ExampleSwiftPage, Error>) -> Void) -> Cancellable?
}

final class DefaultSearchExampleSwiftUseCase: SearchExampleSwiftUseCase {
    
    private let exampleSwiftRepository: ExampleSwiftRepository
    private let exampleSwiftQueryRepository: ExampleSwiftQueryRepository
    
    init(exampleSwiftRepository: ExampleSwiftRepository,
         exampleSwiftQueryRepository: ExampleSwiftQueryRepository) {
        
        self.exampleSwiftRepository = exampleSwiftRepository
        self.exampleSwiftQueryRepository = exampleSwiftQueryRepository
    }
    
    func execute(requestValue: SearchExampleSwiftUseCaseRequestValue,
                 cached: @escaping (ExampleSwiftPage) -> Void,
                 completion: @escaping (Result<ExampleSwiftPage, Error>) -> Void) -> Cancellable? {
        
        return exampleSwiftRepository.fetchExampleSwiftList(query: requestValue.query,
                                                  page: requestValue.page,
                                                  cached: cached,
                                                  completion: { result in
            if case .success = result {
                self.exampleSwiftQueryRepository.saveRecentQuery(query: requestValue.query, completion: { _ in })
            }
            completion (result)
        })
    }
}

struct SearchExampleSwiftUseCaseRequestValue {
    let query: ExampleSwiftQuery
    let page: Int
}
