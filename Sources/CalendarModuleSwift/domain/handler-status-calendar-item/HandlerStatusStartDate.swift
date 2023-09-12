//
//  File.swift
//  
//
//  Created by Jhon Munar on 12/09/23.
//

import Foundation


class HandlerStatusStartDate: HandlerStatusCalendarItem{
    
    var nextHandler: HandlerStatusCalendarItem?
    var startDate: Date?
    
    init(nextHandler: HandlerStatusCalendarItem? = nil, startDate: Date?) {
        self.nextHandler = nextHandler
        self.startDate = startDate
    }
    
    func handle(request: Date) -> StatusCalendarItem? {
        if  let startDate = startDate, request <= startDate {
            return .disabled
        }else{
            return nextHandler?.handle(request: request)
        }
    }
}
