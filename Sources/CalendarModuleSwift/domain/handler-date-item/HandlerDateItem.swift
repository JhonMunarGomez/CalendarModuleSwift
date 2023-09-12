//
//  File.swift
//  
//
//  Created by Jhon Munar on 12/09/23.
//

import Foundation

protocol HandlerDateItem: AnyObject{

    @discardableResult
    func setNext(handler: HandlerDateItem) -> HandlerDateItem

    func handle(request: CreationDate) -> Date?

    var nextHandler: HandlerDateItem? { get set }
}


extension HandlerDateItem {

    func setNext(handler: HandlerDateItem) -> HandlerDateItem {
        self.nextHandler = handler

        /// Returning a handler from here will let us link handlers in a
        /// convenient way like this:
        /// monkey.setNext(handler: squirrel).setNext(handler: dog)
        return handler
    }

    func handle(request: String) -> String? {
        return nextHandler?.handle(request: request)
    }
    
    func createDate(day: Int, month:Int, year: Int) -> Date{
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        return calendar.date(from: dateComponents) ?? Date()
    }
    
}
