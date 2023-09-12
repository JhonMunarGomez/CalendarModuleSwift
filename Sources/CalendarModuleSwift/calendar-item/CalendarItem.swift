//
//  SwiftUIView.swift
//  
//
//  Created by Jhon Munar on 11/09/23.
//

import SwiftUI

enum StatusCalendarItem {
    case selected
    case disabled
    case noselected
    case nomonth
}

struct CalendarItem: View {
    let day: String
    let status: StatusCalendarItem

    var action: (Bool) -> Void
    var body: some View {
        switch (status){
        case .selected:
            Button{
                action(false)
            }label :{
                VStack{
                    TextDayGridCalendar(day, color: Color(Constants.textActive, bundle: .module))
                }.background(Color(Constants.blueColor, bundle: .module))
            }
          
            
        case .noselected:
            Button{
                action(true)
            }label: {
                VStack{
                    TextDayGridCalendar(day, color: Color(Constants.textActive,bundle: .module))
                }.background(Color(.white))
            }

        case .disabled:
            Button{
               action(false)
            }label:{
                VStack{
                    TextDayGridCalendar(day, color: Color(Constants.textDisabled, bundle: .module))
                }.background(Color(Constants.grayColor, bundle: .module))
            }
        case .nomonth:
            Button{
               action(false)
            }label:{
                VStack{
                    TextDayGridCalendar(day, color: Color(Constants.textDisabled, bundle: .module))
                }
            }
        }
        
    }
}



struct CalendarItem_Previews: PreviewProvider {
    static var previews: some View {
        CalendarItem(day: "1", status: .noselected){_ in
            
        }
    }
}
