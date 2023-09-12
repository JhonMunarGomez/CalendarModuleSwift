//
//  File.swift
//  
//
//  Created by Jhon Munar on 12/09/23.
//

import Foundation



class HandlerStatusNoMonth: HandlerStatusCalendarItem{
    var nextHandler: HandlerStatusCalendarItem?
    var referenceDate: Date
    init(nextHandler: HandlerStatusCalendarItem? = nil, referenceDate: Date) {
        self.nextHandler = nextHandler
        self.referenceDate = referenceDate
    }
    func handle(request: Date) -> StatusCalendarItem? {
        let calendar = Calendar.current
        let referenceDateComponents = calendar.dateComponents([.year,.month,.day], from: self.referenceDate)
        
        let dateComponents = calendar.dateComponents([.month], from: request)
        
        if referenceDateComponents.month != dateComponents.month {
            return .nomonth
        }else{
            return nextHandler?.handle(request: request)
        }
    }
}
