//
//  File.swift
//  
//
//  Created by Jhon Munar on 12/09/23.
//

import Foundation


class HandlerStatusSundayRestriction:  HandlerStatusCalendarItem{
    var nextHandler: HandlerStatusCalendarItem?
    var isDisabledSunday:Bool
    
    init(nextHandler: HandlerStatusCalendarItem? = nil, isDisabledEndWeek: Bool) {
        self.nextHandler = nextHandler
        self.isDisabledSunday = isDisabledEndWeek
    }
    
    func handle(request: Date) -> StatusCalendarItem? {
        
        let dayWeek = CalendarHelper().weekDay(request)
        //EndWeek just include sunday
        if isDisabledSunday ,dayWeek == 0{
            return .disabled
        }else{
            return nextHandler?.handle(request: request)
        }
        
    }
}
