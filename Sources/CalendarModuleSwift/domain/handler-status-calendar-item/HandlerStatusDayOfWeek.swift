//
//  File.swift
//  
//
//  Created by Jhon Munar on 12/09/23.
//

import Foundation


class HandlerStatusDayOfWeek:  HandlerStatusCalendarItem{
    var nextHandler: HandlerStatusCalendarItem?
    var isDisabledEndWeek:Bool
    
    init(nextHandler: HandlerStatusCalendarItem? = nil, isDisabledEndWeek: Bool) {
        self.nextHandler = nextHandler
        self.isDisabledEndWeek = isDisabledEndWeek
    }
    
    func handle(request: Date) -> StatusCalendarItem? {
        
        let dayWeek = CalendarHelper().weekDay(request)
        if isDisabledEndWeek ,dayWeek == 0{
            return .disabled
        }else{
            return nextHandler?.handle(request: request)
        }
        
    }
}
