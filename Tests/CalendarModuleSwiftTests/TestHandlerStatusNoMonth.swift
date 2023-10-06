//
//  TestHandlerStatusNoMonth.swift
//  
//
//  Created by Jhon Munar on 6/10/23.
//

import XCTest
@testable import CalendarModuleSwift

final class TestHandlerStatusNoMonth: XCTestCase {
    var handlerStatusNoMonth: HandlerStatusNoMonth!
    override func setUpWithError() throws {
        let monthDate:Date = Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 6))!
         handlerStatusNoMonth = HandlerStatusNoMonth(referenceDate: monthDate)
    }

    override func tearDownWithError() throws {
         handlerStatusNoMonth = nil
    }
    
    func testIsNotMonthDate() throws {
        let monthDate:Date = Calendar.current.date(from: DateComponents(year: 2023, month: 11, day: 4))!
        let statusCalendar: StatusCalendarItem? = handlerStatusNoMonth.handle(request: monthDate)
        XCTAssertEqual(statusCalendar, .nomonth)
    }
    
    func testIsMonthDate() throws {
        let monthDate:Date = Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 4))!
        let statusCalendar: StatusCalendarItem? = handlerStatusNoMonth.handle(request: monthDate)
        XCTAssertNil(statusCalendar)
    }

}
