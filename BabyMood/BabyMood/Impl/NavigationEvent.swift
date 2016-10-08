//
//  NavigationEvent.swift
//  BabyMood
//
//  Created by Daniel on 9/23/16.
//  Copyright © 2016 Worthless Apps. All rights reserved.
//

import UIKit

enum NavigationEvent {
    
    enum PushStyle {
        case Push, Modal
    }
    
    case Push(UIViewController, PushStyle)
    case Pop
    
    init(_ viewModel: ViewModelProtocol) {
        
        /*if let vm = viewModel as? TodoTableViewModel {
            self = .Push(TodoTableViewController(viewModel: vm), .Push)
        } else if let vm = viewModel as? CreateTodoViewModel {
            self = .Push(CreateTodoViewController(viewModel: vm), .Modal)
        } else {
            self = .Push(UIViewController(), .Push)
        }*/
        self = .Push(UIViewController(), .Push)
    }
    
}
