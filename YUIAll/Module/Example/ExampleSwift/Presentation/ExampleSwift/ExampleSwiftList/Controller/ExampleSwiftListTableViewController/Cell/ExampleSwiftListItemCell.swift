////
////  ExampleSwiftListItemCell.swift
////  YUIAll
////
////  Created by SPDBVIP453 on 2023/2/20.
////
//
//import UIKit
//
//final class ExampleSwiftListItemCell: UITableViewCell {
//
//    static let reuseIdentifier = String(describing: ExampleSwiftListItemCell.self)
//    static let height = CGFloat(130)
//
//    private var titleLabel = UILabel()
//    private var dateLabel = UILabel()
//    private var overviewLabel = UILabel()
//    private var posterImageView = UIImageView()
//
//    private var viewModel: ExampleSwiftListItemViewModel!
//    private var posterImageRepository: PosterImageRepository?
////    private var iamgeLoadTask: Cancellable? { willSet { imageLoadTask?.cancel() } }
//
//    func fill(will viewModel: ExampleSwiftListItemViewModel, posterImageRepository: PosterImageRepository?) {
//        self.viewModel = viewModel
//        self.posterImageRepository = posterImageRepository
//    }
//
//    private func updatePosterImage(widrh: Int) {
//        posterImageView.image = nil
//        guard let posterImagePath = viewModel.posterImagePath else { return }
//
//
//    }
//}
