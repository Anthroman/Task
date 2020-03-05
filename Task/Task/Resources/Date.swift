//
//  Date.swift
//  Task
//
//  Created by Anthroman on 3/4/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import Foundation

extension Date {
    
    var formatted: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}
