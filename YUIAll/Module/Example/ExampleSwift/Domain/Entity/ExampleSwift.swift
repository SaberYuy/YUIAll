//
//  ExampleSwift.swift
//  YUIAll
//
//  Created by SPDBVIP453 on 2023/2/16.
//

import Foundation

struct ExampleSwift: Equatable, Identifiable {
    typealias Identifier = String
    enum Genre {
        case adventure
        case scienceFiction
    }
    let id: Identifier
    let title: String?
    let genre: Genre?
    let posterPath: String?
    let overview: String?
    let releaseDate: Date?
}

struct ExampleSwiftPage: Equatable {
    let page: Int
    let totalPage: Int
    let exampleSwifts: [ExampleSwift]
}
