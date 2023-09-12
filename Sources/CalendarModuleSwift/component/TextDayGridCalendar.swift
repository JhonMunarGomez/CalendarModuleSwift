//
//  SwiftUIView.swift
//  
//
//  Created by Jhon Munar on 11/09/23.
//

import SwiftUI

struct TextDayGridCalendar: View {
    let value:String
    let foregroundColor: Color
    init(_ value: String, color: Color){
        self.value = value
        self.foregroundColor = color
    }
    var body: some View {
        Text(value)
            .foregroundColor(foregroundColor)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct TextDayGridCalendar_Previews: PreviewProvider {
    static var previews: some View {
        TextDayGridCalendar("1", color: .gray)
    }
}
