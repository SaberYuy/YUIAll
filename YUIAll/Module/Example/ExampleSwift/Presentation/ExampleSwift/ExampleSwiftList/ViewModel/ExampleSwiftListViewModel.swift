//
//  ExampleSwiftListViewModel.swift
//  YUIAll
//
//  Created by YUI on 2023/2/6.
//

import Foundation

struct ExampleListViewModelActions {
    
    /// Note: if you would need to edit example inside Details screen and update this Movies List screen with updated example then you would need this closure:
    //    let showExampleDetails: (Example, @escaping (_ updated: Example) -> Void) -> Void
    let showExampleDetail: (Example) -> Void
    let showExampleQuerySuggestion: (@escaping (_ didSelect: ExampleQuery) -> Void) -> Void
    let closeExampleQuerySuggestion: () -> Void
}

enum ExampleListViewModelLoading {
    case fullScreen
    case nextPage
}

//protocol 
