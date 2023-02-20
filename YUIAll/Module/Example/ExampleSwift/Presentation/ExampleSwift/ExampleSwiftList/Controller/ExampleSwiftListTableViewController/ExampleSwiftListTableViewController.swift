//
//  ExampleSwiftListTableViewController.swift
//  YUIAll
//
//  Created by SPDBVIP453 on 2023/2/20.
//

import UIKit

final class ExampleSwiftListTableViewController: UITableViewController {
    var viewModel: ExampleSwiftListViewModel!
    
    var posterImagesRepository: PosterImageRepository?
    var nextPageLoadingSpinner: UIActivityIndicatorView?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func reload() {
        tableView.reloadData()
    }

    func updateLoading(_ loading: ExampleSwiftListViewModelLoading?) {
        switch loading {
        case .nextPage:
            nextPageLoadingSpinner?.removeFromSuperview()
            nextPageLoadingSpinner = makeActivityIndicator(size: .init(width: tableView.frame.width, height: 44))
            tableView.tableFooterView = nextPageLoadingSpinner
        case .fullScreen, .none:
            tableView.tableFooterView = nil
        }
    }
    
    // MARK: - Private
    
    private func setupViews() {
        tableView.estimatedRowHeight =
        tableView
    }
}
