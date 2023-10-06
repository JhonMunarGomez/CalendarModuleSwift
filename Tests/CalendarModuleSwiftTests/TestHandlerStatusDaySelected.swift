//
//  TestHandlerStatusDaySelected.swift
//  
//
//  Created by Jhon Munar on 6/10/23.
//

import XCTest
@testable import CalendarModuleSwift

final class TestHandlerStatusDaySelected: XCTestCase {
    var handlerStatusDaySelected: HandlerStatusDaySelected!
    override func setUpWithError() throws {
        let daySelected:Date = Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 8))!
        handlerStatusDaySelected = HandlerStatusDaySelected(selectedDate: daySelected)
    }

    override func tearDownWithError() throws {
        handlerStatusDaySelected = nil
    }
    
    func testIsDaySelected() throws {
        let daySelected:Date = Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 8))!
        let statusCalendar: StatusCalendarItem? = handlerStatusDaySelected.handle(request: daySelected)
        XCTAssertEqual(statusCalendar, .selected)
    }
    
    func testIsNotDaySelected() throws {
        let daySelected:Date = Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 7))!
        let statusCalendar: StatusCalendarItem? = handlerStatusDaySelected.handle(request: daySelected)
        XCTAssertNil(statusCalendar)
    }
}
