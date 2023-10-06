//
//  TestHandlerStatusCalendarDayBlocker.swift
//  
//
//  Created by Jhon Munar on 6/10/23.
//

import XCTest
@testable import CalendarModuleSwift

final class TestHandlerStatusCalendarDayBlocker: XCTestCase {
    var handlerStatusCalendarDayBlocker: HandlerStatusDayBlocker!
    override func setUpWithError() throws {
        var dayBlocker:[String: Bool] = [:]
        dayBlocker["20/08/2012"] = true
        handlerStatusCalendarDayBlocker = HandlerStatusDayBlocker(blockerDay: dayBlocker)
    }

    override func tearDownWithError() throws {
         handlerStatusCalendarDayBlocker = nil
    }
    
    func testDayBlockerIsDisabled20082012() throws{
        let isDayBlocker:Date = Calendar.current.date(from: DateComponents(year: 2012, month: 8, day: 20))!
        let statusItem: StatusCalendarItem? =  handlerStatusCalendarDayBlocker.handle(request: isDayBlocker)
        XCTAssertEqual(statusItem, .disabled)
    }
    
    func testIsNotDayBlocker() throws{
        let isDayBlocker:Date = Calendar.current.date(from: DateComponents(year: 2012, month: 8, day: 21))!
        let statusItem: StatusCalendarItem? =  handlerStatusCalendarDayBlocker.handle(request: isDayBlocker)
       XCTAssertNil(statusItem)
    }


}
