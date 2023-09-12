//
//  File.swift
//  
//
//  Created by Jhon Munar on 12/09/23.
//

import Foundation


class HandlerStatusEndDate: HandlerStatusCalendarItem{
    
    var nextHandler: HandlerStatusCalendarItem?
    var endDate: Date?
    
    init(nextHandler: HandlerStatusCalendarItem? = nil, endDate: Date?) {
        self.nextHandler = nextHandler
        self.endDate = endDate
    }
    
    func handle(request: Date) -> StatusCalendarItem? {
        if  let endDate = endDate,request >= endDate {
            return .disabled
        }else{
            return nextHandler?.handle(request: request)
        }
    }
}
