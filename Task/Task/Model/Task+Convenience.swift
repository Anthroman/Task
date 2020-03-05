//
//  Task+Convenience.swift
//  Task
//
//  Created by Anthroman on 3/4/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    @discardableResult
    
    convenience init(name: String, notes: String? = "", due: Date = Date(), isComplete: Bool = false, moc: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: moc)
        self.name = name
    }
}
