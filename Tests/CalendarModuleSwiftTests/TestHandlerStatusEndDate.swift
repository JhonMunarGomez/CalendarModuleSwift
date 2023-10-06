//
//  TestHandlerStatusEndDate.swift
//  
//
//  Created by Jhon Munar on 6/10/23.
//

import XCTest
@testable import CalendarModuleSwift
final class TestHandlerStatusEndDate: XCTestCase {
    var handlerStatusEndDate: HandlerStatusEndDate!
    var handlerStatusEndDateIsNil: HandlerStatusEndDate!
    override func setUpWithError() throws {
        let endDate:Date? = Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 8))!
        
        handlerStatusEndDate = HandlerStatusEndDate(endDate: endDate)
        handlerStatusEndDateIsNil = HandlerStatusEndDate(endDate: nil)
    }

    override func tearDownWithError() throws {
         handlerStatusEndDate = nil
    }

    func testIsDayAfterEndDate() throws{
        //this class include the day of EndDate
        let endDate:Date = Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 9))!
        let statusCalendar: StatusCalendarItem? = handlerStatusEndDate.handle(request: endDate)
        XCTAssertEqual(statusCalendar, .disabled)
    }
    
    func testIsNotDayAfterEndDate() throws {
        let endDate:Date = Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 6))!
        let statusCalendar: StatusCalendarItem? = handlerStatusEndDate.handle(request: endDate)
        XCTAssertNil(statusCalendar)
    }
    
    func testCreationIsNil() throws {
        let endDate:Date = Calendar.current.date(from: DateComponents(year: 2023, month: 10, day: 6))!
        let statusCalendar: StatusCalendarItem? = handlerStatusEndDateIsNil.handle(request: endDate)
        XCTAssertNil(statusCalendar)
    }
    

}
