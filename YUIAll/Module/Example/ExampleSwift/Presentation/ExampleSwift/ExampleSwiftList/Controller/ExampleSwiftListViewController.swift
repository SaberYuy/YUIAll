//
//  ExampleSwiftListViewController.swift
//  YUIAll
//
//  Created by YUI on 2023/2/6.
//

import UIKit

class ExampleSwiftListViewController: YACommonArchitectureViewController, StoryboardInstantiable, Alertable {

    private var contentView = UIView()
    private var exampleSwiftListContainer = UIView()
    private(set) var suggestionListContainer = UIView()
    private var searchBarContainer = UIView()
    private var emptyDataLabel = UILabel()
    
    private var viewModel: ExampleSwiftListViewModel!
    private var posterImagesRepository: PosterImageRepository?
    
    private var exampleSwiftTableViewController: ExampleSwiftListTableViewController?
//    priva
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
