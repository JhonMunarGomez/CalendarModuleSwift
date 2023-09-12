//
//  SwiftUIView.swift
//  
//
//  Created by Jhon Munar on 11/09/23.
//

import SwiftUI

struct TextDayWeek: View {
    let value:String
    init(_ value: String) {
        self.value = value
    }
    var body: some View {
        Text(value)
            .frame(maxWidth: .infinity)
            .padding(.top, 1)
            .lineLimit(1)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TextDayWeek("Mon")
    }
}
