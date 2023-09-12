//
//  File.swift
//  
//
//  Created by Jhon Munar on 12/09/23.
//

import Foundation


class HandlerStatusDayBlocker: HandlerStatusCalendarItem{
    var nextHandler: HandlerStatusCalendarItem?
    var blockerDay: [String:Bool]
    init(nextHandler: HandlerStatusCalendarItem? = nil, blockerDay: [String : Bool]) {
        self.nextHandler = nextHandler
        self.blockerDay = blockerDay
    }
    func handle(request: Date) -> StatusCalendarItem? {
        let formattedDate: formattedDate = formattedddMMyyyy(dateFormatter: DateFormatter())
        if  !blockerDay.isEmpty, blockerDay[formattedDate.formatted(date: request)] ?? false {
            return .disabled
        }else{
            return nextHandler?.handle(request: request)
        }
    }
}
