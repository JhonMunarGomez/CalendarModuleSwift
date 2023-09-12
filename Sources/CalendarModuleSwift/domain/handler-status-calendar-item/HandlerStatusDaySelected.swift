//
//  File.swift
//  
//
//  Created by Jhon Munar on 12/09/23.
//

import Foundation


class HandlerStatusDaySelected: HandlerStatusCalendarItem{
    
    var nextHandler: HandlerStatusCalendarItem?
    var selectedDate: Date
    init(nextHandler: HandlerStatusCalendarItem? = nil, selectedDate: Date) {
        self.nextHandler = nextHandler
        self.selectedDate = selectedDate
    }
    
    func handle(request: Date) -> StatusCalendarItem? {
        let calendar = Calendar.current
        if(calendar.isDate(request, inSameDayAs: selectedDate)){
            return .selected
        }else{
            return nextHandler?.handle(request: request)
        }
    }
}
