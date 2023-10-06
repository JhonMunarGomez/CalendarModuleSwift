//
//  SwiftUIView.swift
//  
//
//  Created by Jhon Munar on 11/09/23.
//

import SwiftUI

public struct CalendarScreen: View {
    
    //MARK: state
    @State private var dateReference: Date = Date()
    @Binding var selectedDate: Date?
    
    //MARK: variable
    private let dateBlockerTemp: [Date]
    private let startDate: Date?
    private let endDate: Date?
    private let isDisabledEndWeek:Bool
    
    //MARK: constant
    let calendar = Calendar.current
    let formattedDate: formattedDate = formattedddMMyyyy(dateFormatter: DateFormatter())
    
    public init(selected: Binding<Date?>,disabledEndWeek:Bool = false ,startDate: Date? = nil, endDate: Date? = nil){
        _selectedDate = selected
        self.dateBlockerTemp = []
        self.startDate = startDate
        self.endDate = endDate
        self.isDisabledEndWeek = disabledEndWeek
    }
    
    
    public init(selected: Binding<Date?>,disabledEndWeek:Bool = false ,blocker: [Date],startDate: Date? = nil, endDate: Date? = nil){
        _selectedDate = selected
        self.dateBlockerTemp = blocker
        self.startDate = startDate
        self.endDate = endDate
        self.isDisabledEndWeek = disabledEndWeek
    }
    
    //Mark: view
    public var body: some View {
        VStack(spacing:0){
            HeaderCalendar(dateReference:$dateReference)
                .padding(.top,20)
                .padding(.bottom,10)
            dayOfWeek
            contentCalendar
        }
        .background(Color(.white))
        .cornerRadius(12)
    }
    
    
    
    var dayOfWeek: some View{
        HStack(alignment: .center){
            TextDayWeek("Dom")
            TextDayWeek("Lun")
            TextDayWeek("Mar")
            TextDayWeek("Mie")
            TextDayWeek("Jue")
            TextDayWeek("Vie")
            TextDayWeek("Sáb")
        }
        .padding(.vertical,5)
    }
    
    var contentCalendar: some View{
        VStack(spacing: 0)
        {
            let daysInMonth = CalendarHelper().daysInMonth(dateReference)
            let firstDayOfMonth = CalendarHelper().firstOfMonth(dateReference)
            let startingSpaces = CalendarHelper().weekDay(firstDayOfMonth)
            let prevMonth = CalendarHelper().minusMonth(dateReference)
            let daysInPrevMonth = CalendarHelper().daysInMonth(prevMonth)
            let blockerDates = self.ArrayToDictionary()
            
            ForEach(0..<6) { row in
                HStack(spacing:0){
                    ForEach(0..<7) { column in
                        let count = (row*7) + (column+1)
                        let date = getDateSelected(startingSpaces: startingSpaces, count: count, daysInPrevMonth: daysInPrevMonth, daysInMonth: daysInMonth)
                        
                        let components = calendar.dateComponents([.year, .month, .day], from: date)
                        
                        CalendarItem(day: "\(components.day ?? 0)", status: self.statusCalendarItem(date:date, dateBlocker: blockerDates)) { isEnabled in
                            if isEnabled {
                                selectedDate = date
                            }
                        }
                    }
                }
            }
            
        }
        .frame(maxHeight: .infinity)
    }
    
    
    
    //MARK: func
    
    private func statusCalendarItem(date: Date, dateBlocker: [String:Bool]) -> StatusCalendarItem {
        
        let handlerStatusNoMonth: HandlerStatusCalendarItem = HandlerStatusNoMonth(referenceDate: self.dateReference)
        
        let handlerStatusDayOfWeek: HandlerStatusCalendarItem =
               HandlerStatusSundayRestriction(isDisabledEndWeek: isDisabledEndWeek)
           
        let handlerStatusDayBlocker: HandlerStatusCalendarItem = HandlerStatusDayBlocker(blockerDay: dateBlocker)
        
        let handlerStatusStartDate: HandlerStatusCalendarItem = HandlerStatusStartDate(startDate: startDate)
        
        let handlerStatusEndDate: HandlerStatusCalendarItem = HandlerStatusEndDate(endDate: endDate)
        
        if let selectedDate {
            let handlerStatusDaySelected: HandlerStatusCalendarItem = HandlerStatusDaySelected(selectedDate: selectedDate)
            handlerStatusNoMonth.setNext(handler: handlerStatusDayOfWeek).setNext(handler: handlerStatusDayBlocker).setNext(handler: handlerStatusDaySelected).setNext(handler: handlerStatusStartDate).setNext(handler: handlerStatusEndDate)
        }else{
            handlerStatusNoMonth.setNext(handler: handlerStatusDayOfWeek).setNext(handler: handlerStatusDayBlocker).setNext(handler: handlerStatusStartDate).setNext(handler: handlerStatusEndDate)
        }
        
        guard let status = handlerStatusNoMonth.handle(request: date) else{
            return .noselected
        }
        return status
        
    }

    private func ArrayToDictionary() -> [String:Bool]{
        if dateBlockerTemp.count > 0 {
            var temp:[String:Bool] = [:]
            dateBlockerTemp.forEach { date in
                let formattedDate = formattedDate.formatted(date: date)
                temp[formattedDate] = true
            }
            return temp
        }
        return [:]
    }
    private func getDateSelected(startingSpaces: Int, count:Int, daysInPrevMonth:Int,daysInMonth:Int) -> Date{
        let components = CalendarHelper().extractAllComponent(dateReference)
        var month:Int = 0
        var year:Int = 0
        month = components.month ?? 0
        year = components.year ?? 0
        
        var creationDate = CreationDate(startingSpaces: startingSpaces, count: count, daysInPrevMonth: daysInPrevMonth, daysInMonth: daysInMonth)
        
        creationDate.monthReference = month
        creationDate.yearReference = year
        
        let handlerBeforeMonth: HandlerDateItem = HandlerBeforeMonth()
        let handlerAfterMonth: HandlerDateItem = HandlerAfterMonth()
        let handlerIntoMonth: HandlerDateItem = HandlerIntoMonth()
        
        handlerBeforeMonth.setNext(handler: handlerAfterMonth).setNext(handler: handlerIntoMonth)
        
        guard let date = handlerIntoMonth.handle(request: creationDate) else{
            return Date()
        }
        return date
    }
}

struct CalendarScreen_Previews: PreviewProvider {
    static var previews: some View {
        CalendarScreen(selected: .constant(Date()))
    }
}
