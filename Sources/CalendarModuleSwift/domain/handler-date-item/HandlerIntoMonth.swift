//
//  File.swift
//  
//
//  Created by Jhon Munar on 12/09/23.
//

import Foundation


class HandlerIntoMonth:HandlerDateItem{
    var nextHandler: HandlerDateItem?

    func handle(request: CreationDate) -> Date? {
        let day = request.count - request.start
        return createDate(day: day, month: request.monthReference, year: request.yearReference)
    }
}
