//
//  File.swift
//  
//
//  Created by Jhon Munar on 12/09/23.
//

import Foundation


class HandlerAfterMonth: HandlerDateItem{
    var nextHandler: HandlerDateItem?

    func handle(request: CreationDate) -> Date? {
        
        if (request.count - request.start > request.daysInMonth)
        {
            let day = request.count - request.start - request.daysInMonth
            var month = request.monthReference
            var year = request.yearReference
            if month + 1 > 12 {
                month = 1
                year = year + 1
            }else{
                month = month + 1
            }
            return createDate(day: day, month: month, year: year)
        }else {
            return nextHandler?.handle(request: request)
        }
    }
}
