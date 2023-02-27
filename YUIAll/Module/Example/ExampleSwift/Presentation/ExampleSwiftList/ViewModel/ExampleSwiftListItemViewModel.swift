//
//  ExampleSwiftListItemViewModel.swift
//  YUIAll
//
//  Created by SPDBVIP453 on 2023/2/17.
//

import Foundation

struct ExampleSwiftListItemViewModel: Equatable {
    let title: String
    let overview: String
    let releaseDate: String
    let posterImagePath: String?
}

extension ExampleSwiftListItemViewModel {
    
    init(example: ExampleSwift) {
        self.title = example.title ?? ""
        self.posterImagePath = example.posterPath
        self.overview = example.overview ?? ""
        if let releaseDate = example.releaseDate {
            self.releaseDate = "\(NSLocalizedString("Release Date", comment: "")): \(dateFormatter.string(from: releaseDate))"
        } else {
            self.releaseDate = NSLocalizedString( "To be announced", comment: "")
        }
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()
