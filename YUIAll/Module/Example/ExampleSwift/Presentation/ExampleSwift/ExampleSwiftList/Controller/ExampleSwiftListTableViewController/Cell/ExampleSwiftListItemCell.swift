//
//  ExampleSwiftListItemCell.swift
//  YUIAll
//
//  Created by SPDBVIP453 on 2023/2/20.
//

import UIKit

final class ExampleSwiftListItemCell: UITableViewCell {

    static let reuseIdentifier = String(describing: ExampleSwiftListItemCell.self)
    static let height = CGFloat(130)

    private var titleLabel = UILabel()
    private var dateLabel = UILabel()
    private var overviewLabel = UILabel()
    private var posterImageView = UIImageView()

    private var viewModel: ExampleSwiftListItemViewModel!
    private var posterImageRepository: PosterImageRepository?
    private var imageLoadTask: Cancellable? { willSet { imageLoadTask?.cancel() } }

    func fill(will viewModel: ExampleSwiftListItemViewModel, posterImageRepository: PosterImageRepository?) {
        self.viewModel = viewModel
        self.posterImageRepository = posterImageRepository
        
        titleLabel.text = viewModel.title
        dateLabel.text = viewModel.releaseDate
        overviewLabel.text = viewModel.overview
        updatePosterImage(width: Int(posterImageView.imageSizeAfterAspectFit.scaledSize.width))
    }

    private func updatePosterImage(width: Int) {
        posterImageView.image = nil
        guard let posterImagePath = viewModel.posterImagePath else { return }
        
        imageLoadTask = posterImageRepository?.fetchImage(with: posterImagePath, width: width, completion: { [weak self] result in
            guard let self = self else { return }
            guard self.viewModel.posterImagePath == posterImagePath else { return }
            if case let .success(data) = result {
                self.posterImageView.image = UIImage(data: data)
            }
            self.imageLoadTask = nil
        })
    }
}
