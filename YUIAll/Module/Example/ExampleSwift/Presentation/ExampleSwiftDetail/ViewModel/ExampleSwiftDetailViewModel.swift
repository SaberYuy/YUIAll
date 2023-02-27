//
//  ExampleSwiftDetailViewModel.swift
//  YUIAll
//
//  Created by SPDBVIP453 on 2023/2/27.
//

import Foundation

protocol ExampleSwiftDetailViewModelInput {
    func updatePosterImage(width: Int)
}

protocol ExampleSwiftDetailViewModelOutput {
    var title: String { get }
    var posterImage: Observable<Data?> { get }
    var isPosterImageHidden: Bool { get }
    var overview: String { get }
}

protocol ExampleSwiftDetailViewModel: ExampleSwiftDetailViewModelInput, ExampleSwiftDetailViewModelOutput { }

final class DefaultExampleSwiftDetailViewModel: ExampleSwiftDetailViewModel {

    private let posterImagePath: String?
    private let posterImageRepository: PosterImageRepository
    private var imageLoadTask: Cancellable? { willSet { imageLoadTask?.cancel() } }
    
    // MARK: - OUTPUT
    let title: String
    let posterImage: Observable<Data?> = Observable(nil)
    let isPosterImageHidden: Bool
    let overview: String
    
    init(exampleSwift: ExampleSwift, posterImageRepository: PosterImageRepository) {
        self.title = exampleSwift.title ?? ""
        self.overview = exampleSwift.overview ?? ""
        self.posterImagePath = exampleSwift.posterPath
        self.isPosterImageHidden = exampleSwift.posterPath == nil
        self.posterImageRepository = posterImageRepository
    }
}

// MARK: - INPUT. View event method
extension DefaultExampleSwiftDetailViewModel {
    
    func updatePosterImage(width: Int) {
        guard let posterImagePath = posterImagePath else { return }
        
        imageLoadTask = posterImageRepository.fetchImage(with: posterImagePath, width: width, completion: { result in
            guard self.posterImagePath == posterImagePath else { return }
            switch result {
            case .success(let data):
                self.posterImage.value = data
            case .failure: break
            }
            self.imageLoadTask = nil
        })
    }
}

