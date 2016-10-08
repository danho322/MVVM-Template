//
//  TabViewModel.swift
//  BabyMood
//
//  Created by Daniel on 9/25/16.
//  Copyright © 2016 Worthless Apps. All rights reserved.
//

import UIKit
import ReactiveCocoa

class TabViewModel: ViewModel {
    // MARK: Properties
    
//    let note: String
//    let dueDateText: String
//    
//    let completed: MutableProperty<Bool>
    
//    var todo: Todo { return _todo.value }
//    private var _todo: MutableProperty<Todo>
    
    // MARK: API
    
    init(services: ViewModelServicesProtocol, other: AnyObject) {
        super.init(services: services)
//        self._todo = MutableProperty(todo)
//        self.note = todo.note
//        self.dueDateText = "Due: \(services.date.format(todo.dueDate))"
//        self.completed = MutableProperty(todo.completed)
//        
//        super.init(services: services)
//        
//        _todo <~ completed.producer
//            .skip(1) // skip the initial value
//            .map(_todo.value.markAs) // transform
//            .flatMap(.Latest, transform: services.todo.update) // update via service
    }

}
