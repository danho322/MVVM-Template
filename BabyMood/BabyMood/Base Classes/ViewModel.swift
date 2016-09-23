//
//  ViewModel.swift
//  BabyMood
//
//  Created by Daniel on 9/23/16.
//  Copyright © 2016 Worthless Apps. All rights reserved.
//

import Foundation

protocol ViewModelProtocol {
    var services: ViewModelServicesProtocol { get }
}

class ViewModel: NSObject, ViewModelProtocol {
    
    let services: ViewModelServicesProtocol
    
    init(services: ViewModelServicesProtocol) {
        self.services = services
        super.init()
    }
}
