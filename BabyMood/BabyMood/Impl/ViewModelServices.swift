//
//  ViewModelServices.swift
//  BabyMood
//
//  Created by Daniel on 9/23/16.
//  Copyright © 2016 Worthless Apps. All rights reserved.
//

import Foundation

protocol ViewModelServicesDelegate: class {
    func services(services: ViewModelServicesProtocol, navigate: NavigationEvent)
}

protocol ViewModelServicesProtocol {
    
}

class ViewModelServices: NSObject, ViewModelServicesProtocol {
    // MARK: Properties
    
//    let todo: TodoServiceProtocol
//    let date: DateServiceProtocol
    
    private weak var delegate: ViewModelServicesDelegate?
    
    // MARK: API
    
    init(delegate: ViewModelServicesDelegate?) {
        self.delegate = delegate
//        self.todo = TodoService()
//        self.date = DateService()
        super.init()
    }
    
    func push(viewModel: ViewModelProtocol) {
        delegate?.services(self, navigate: NavigationEvent(viewModel))
    }
    
    func pop(viewModel: ViewModelProtocol) {
        delegate?.services(self, navigate: .Pop)
    }
}
