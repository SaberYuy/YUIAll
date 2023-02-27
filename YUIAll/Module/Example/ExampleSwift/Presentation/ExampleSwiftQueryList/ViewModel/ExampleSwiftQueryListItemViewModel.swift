//
//  ExampleSwiftQueryListItemViewModel.swift
//  YUIAll
//
//  Created by SPDBVIP453 on 2023/2/23.
//

import Foundation

class ExampleSwiftQueryListItemViewModel {
    let query: String
    
    init(query: String) {
        self.query = query
    }
}

extension ExampleSwiftQueryListItemViewModel: Equatable {
    static func == (lhs: ExampleSwiftQueryListItemViewModel, rhs: ExampleSwiftQueryListItemViewModel) -> Bool {
        return lhs.query == rhs.query
    }
}
