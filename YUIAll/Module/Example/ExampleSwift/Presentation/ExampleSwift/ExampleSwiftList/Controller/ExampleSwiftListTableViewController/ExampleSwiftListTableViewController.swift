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
        tableView.estimatedRowHeight = ExampleSwiftListItemCell.height
        tableView.rowHeight = UITableView.automaticDimension
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension ExampleSwiftListTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.value.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExampleSwiftListItemCell.reuseIdentifier, for: indexPath) as? ExampleSwiftListItemCell else {
            assertionFailure("Cannot dequeue reusable cell \(ExampleSwiftListItemCell.self) with reuseIdentifier: \(ExampleSwiftListItemCell.reuseIdentifier)")
            return UITableViewCell()
        }
        cell.fill(will: viewModel.items.value[indexPath.row], posterImageRepository: posterImagesRepository)
        
        if indexPath.row == viewModel.items.value.count - 1 {
            viewModel.didLoadNextPage()
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.isEmpty ? tableView.frame.height : super.tableView( tableView, heightForRowAt: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectItem(at: indexPath.row)
    }
}
