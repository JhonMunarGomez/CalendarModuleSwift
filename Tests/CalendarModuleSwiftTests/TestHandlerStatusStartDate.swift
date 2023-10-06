//
//  TestHandlerStatusStartDate.swift
//  
//
//  Created by Jhon Munar on 6/10/23.
//

import XCTest
@testable import CalendarModuleSwift

final class TestHandlerStatusStartDate: XCTestCase {

    var handlerStatusStartDate: HandlerStatusStartDate!
    var handlerStatusStartDateIsNil: HandlerStatusStartDate!
    override func setUpWithError() throws {
        let startDate:Date? = Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 8))!
        
        handlerStatusStartDate = HandlerStatusStartDate(startDate: startDate)
        handlerStatusStartDateIsNil = HandlerStatusStartDate(startDate: nil)
    }

    override func tearDownWithError() throws {
         handlerStatusStartDate = nil
    }

    func testIsDayBeforeStartDate() throws{
        //this class include the day of startDate
        let endDate:Date = Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 7))!
        let statusCalendar: StatusCalendarItem? = handlerStatusStartDate.handle(request: endDate)
        XCTAssertEqual(statusCalendar, .disabled)
    }
    
    func testIsNotDayBeforeStartDate() throws {
        let endDate:Date = Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 12))!
        let statusCalendar: StatusCalendarItem? = handlerStatusStartDate.handle(request: endDate)
        XCTAssertNil(statusCalendar)
    }
    
    func testCreationIsNil() throws {
        let endDate:Date = Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 6))!
        let statusCalendar: StatusCalendarItem? = handlerStatusStartDateIsNil.handle(request: endDate)
        XCTAssertNil(statusCalendar)
    }
    


}
