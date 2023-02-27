//
//  ExampleSwiftResposeDTO+Mapping.swift
//  YUIAll
//
//  Created by SPDBVIP453 on 2023/2/27.
//

import Foundation

// MARK: - Data Transfer Object

struct ExampleSwiftResposeDTO: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case page
        case totalPage = "total_pages"
        case exampleSwifts = "results"
    }
    let page: Int
    let totalPage: Int
    let exampleSwifts: [ExampleSwiftDTO]
}

extension ExampleSwiftResposeDTO {
    
    struct ExampleSwiftDTO: Decodable {
        private enum CodingKeys: String, CodingKey {
            case id
            case title
            case genre
            case posterPath = "poster_path"
            case overview
            case releaseData = "release_date"
        }
        enum GenreDTO: String, Decodable {
            case adventure
            case scienceFiction = "science_fiction"
        }
        let id: Int
        let title: String?
        let genre: GenreDTO?
        let posterPath: String?
        let overview: String?
        let releaseData: String?
    }
}

// MARK: Mapping to Domain

extension ExampleSwiftResposeDTO {
    
    func toDomain() -> ExampleSwiftPage {
        return .init(page: page,
                     totalPage: totalPage,
                     exampleSwifts: exampleSwifts.map { $0.toDomain() })
    }
}

extension ExampleSwiftResposeDTO.ExampleSwiftDTO {
    
    func toDomain() -> ExampleSwift {
        return .init(id: ExampleSwift.Identifier(id),
                     title: title,
                     genre: genre?.toDomain(),
                     posterPath: posterPath,
                     overview: overview,
                     releaseDate: dateFormatter.date(from: releaseData ?? ""))
    }
}

extension ExampleSwiftResposeDTO.ExampleSwiftDTO.GenreDTO {
    
    func toDomain() -> ExampleSwift.Genre {
        switch self {
        case .adventure: return .adventure
        case .scienceFiction: return .scienceFiction
        }
    }
}

// MARK: - Private

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    formatter.calendar = Calendar(identifier: .iso8601)
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
}()
