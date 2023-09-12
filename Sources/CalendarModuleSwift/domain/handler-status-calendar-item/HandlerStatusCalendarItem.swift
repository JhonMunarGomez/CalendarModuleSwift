//
//  File.swift
//  
//
//  Created by Jhon Munar on 12/09/23.
//

import Foundation


protocol HandlerStatusCalendarItem: AnyObject{

    @discardableResult
    func setNext(handler: HandlerStatusCalendarItem) -> HandlerStatusCalendarItem

    func handle(request: Date) -> StatusCalendarItem?

    var nextHandler: HandlerStatusCalendarItem? { get set }
}


extension HandlerStatusCalendarItem {

    func setNext(handler: HandlerStatusCalendarItem) -> HandlerStatusCalendarItem {
        self.nextHandler = handler

        /// Returning a handler from here will let us link handlers in a
        /// convenient way like this:
        /// monkey.setNext(handler: squirrel).setNext(handler: dog)
        return handler
    }

    func handle(request: String) -> String? {
        return nextHandler?.handle(request: request)
    }
    
    
}
