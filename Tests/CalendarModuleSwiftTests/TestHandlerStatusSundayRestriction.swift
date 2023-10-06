//
//  TestHandlerStatusSundayRestriction.swift
//  
//
//  Created by Jhon Munar on 6/10/23.
//

import XCTest
@testable import CalendarModuleSwift
final class TestHandlerStatusSundayRestriction: XCTestCase {

    var handlerStatusCalendarDayOfWeek: HandlerStatusSundayRestriction!
    override func setUpWithError() throws {
        handlerStatusCalendarDayOfWeek = HandlerStatusSundayRestriction(isDisabledEndWeek: true)
    }

    override func tearDownWithError() throws {
        handlerStatusCalendarDayOfWeek = nil
    }

    func testIsDaySunday() throws{
        let isDateEndWeek:Date = Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 8))!
        let statusItem: StatusCalendarItem? = handlerStatusCalendarDayOfWeek.handle(request: isDateEndWeek)
        XCTAssertEqual(statusItem, .disabled)
        
    }
    
    func testIsNotSunday() throws{
        let isDateEndWeek:Date = Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 7))!
        let statusItem: StatusCalendarItem? = handlerStatusCalendarDayOfWeek.handle(request: isDateEndWeek)
        XCTAssertNil(statusItem)
    }
    

}
