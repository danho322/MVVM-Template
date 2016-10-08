//
//  ReactiveViewController.swift
//  BabyMood
//
//  Created by Daniel on 9/23/16.
//  Copyright © 2016 Worthless Apps. All rights reserved.
//

import UIKit

class ReactiveViewController<T: ViewModelProtocol>: UIViewController {
    
    // MARK: Properties
    
    let viewModel: T
    
    // MARK: API
    
    init(viewModel: T, nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        self.viewModel = viewModel
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    convenience init(viewModel: T) {
        self.init(viewModel: viewModel, nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
