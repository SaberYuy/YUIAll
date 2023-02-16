//
//  SearchExampleUseCase.swift
//  YUIAll
//
//  Created by SPDBVIP453 on 2023/2/16.
//

import Foundation

protocol SearchExampleUseCase {
    func execute(requestValue: SearchExampleUseCaseRequestValue,
                 cached: @escaping (ExamplePage) -> Void,
                 completion: @escaping (Result<ExamplePage, Error>) -> Void) -> Cancellable?
}

final class DefaultSearchExampleUseCase: SearchExampleUseCase {
    
    private let exampleRepository: ExampleRepository
    private let exampleQueryRepository: ExampleQueryRepository
    
    init(exampleRepository: ExampleRepository,
         exampleQueryRepository: ExampleQueryRepository) {
        
        self.exampleRepository = exampleRepository
        self.exampleQueryRepository = exampleQueryRepository
    }
    
    func execute(requestValue: SearchExampleUseCaseRequestValue,
                 cached: @escaping (ExamplePage) -> Void,
                 completion: @escaping (Result<ExamplePage, Error>) -> Void) -> Cancellable? {
        
        return exampleRepository.fetchExampleList(query: requestValue.query,
                                                  page: requestValue.page,
                                                  cached: cached,
                                                  completion: { result in
            if case .success = result {
                self.exampleQueryRepository.saveRecentQuery(query: requestValue.query, completion: { _ in })
            }
            completion (result)
        })
    }
}

struct SearchExampleUseCaseRequestValue {
    let query: ExampleQuery
    let page: Int
}
