//
//  File.swift
//  
//
//  Created by Jhon Munar on 12/09/23.
//

import Foundation


struct CreationDate {
    var startingSpaces: Int
    var count: Int
    var daysInPrevMonth:Int
    var daysInMonth: Int
    var start: Int
    
    var monthReference: Int
    var yearReference:Int
    
    init(startingSpaces: Int, count: Int, daysInPrevMonth: Int, daysInMonth: Int) {
        self.startingSpaces = startingSpaces
        self.count = count
        self.daysInPrevMonth = daysInPrevMonth
        self.daysInMonth = daysInMonth
        self.start = startingSpaces == 0 ? startingSpaces + Constants.numberColumn : startingSpaces
        self.monthReference = 0
        self.yearReference = 0
    }
}
