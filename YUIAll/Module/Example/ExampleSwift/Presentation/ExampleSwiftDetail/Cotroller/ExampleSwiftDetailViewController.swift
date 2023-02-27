//
//  ExampleSwiftDetailViewController.swift
//  YUIAll
//
//  Created by SPDBVIP453 on 2023/2/27.
//

import UIKit

final class ExampleSwiftDetailViewController: UIViewController, StoryboardInstantiable {
    
    private var posterImageView: UIImageView!
    private var overviewTextView: UITextView!
    
    // MARK: - Lifecycle
    
    private var viewModel: ExampleSwiftDetailViewModel!
    
    static func create(with viewModel: ExampleSwiftDetailViewModel) -> ExampleSwiftDetailViewController {
        let view = ExampleSwiftDetailViewController.instantiateViewController()
        view.viewModel = viewModel
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bind(to: viewModel)
    }
    
    private func bind(to viewModel: ExampleSwiftDetailViewModel) {
        viewModel.posterImage.observe(on: self) { [weak self] in
            self?.posterImageView.image = $0.flatMap(UIImage.init)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewModel.updatePosterImage(width: Int(posterImageView.imageSizeAfterAspectFit.scaledSize.width))
    }
    
    // MARK: Private
    private func setupView() {
        title = viewModel.title
        overviewTextView.text = viewModel.title
        
    }
}
