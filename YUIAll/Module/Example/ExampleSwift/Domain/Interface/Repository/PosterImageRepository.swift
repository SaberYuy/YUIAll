//
//  PosterImageRepository.swift
//  YUIAll
//
//  Created by SPDBVIP453 on 2023/2/20.
//

import Foundation

protocol PosterImageRepository {
    func fetchImage(with imagePath: String, width: Int, completion: @escaping (Result<Data, Error>) -> Void) -> Cancellable?
}
