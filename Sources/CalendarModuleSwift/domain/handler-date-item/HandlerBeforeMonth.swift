//
//  File.swift
//  
//
//  Created by Jhon Munar on 12/09/23.
//

import Foundation


class HandlerBeforeMonth: HandlerDateItem{
    var nextHandler: HandlerDateItem?

    func handle(request: CreationDate) -> Date? {
        if(request.count <= request.start){
            let day = request.daysInPrevMonth + request.count - request.start
            var year:Int = request.yearReference
            var month:Int = request.monthReference
            if month - 1 < 1 {
                month = 12
                year = year - 1
            }else{
                month = month - 1
            }
            return createDate(day: day, month: month, year: year)
          
        } else {
            return nextHandler?.handle(request: request)
        }
    }
}
