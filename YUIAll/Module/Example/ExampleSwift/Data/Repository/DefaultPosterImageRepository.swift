//
//  DefaultPosterImageRepository.swift
//  YUIAll
//
//  Created by SPDBVIP453 on 2023/2/27.
//

import Foundation

final class DefaultPosterImageRepository {
    
    private let dataTransferService: DataTransferService
    
    init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
}

extension DefaultPosterImageRepository: PosterImageRepository {
    
    func fetchImage(with imagePath: String, width: Int, completion: @escaping (Result<Data, Error>) -> Void) -> Cancellable? {
        
        let endpoint = 
    }
}

