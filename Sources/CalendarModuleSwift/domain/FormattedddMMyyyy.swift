//
//  File.swift
//  
//
//  Created by Jhon Munar on 12/09/23.
//

import Foundation

protocol formattedDate {
    func formatted(date: Date) -> String
}

class formattedddMMyyyy: formattedDate {
    private var dateFormatter: DateFormatter?
    
    init(dateFormatter: DateFormatter) {
        self.dateFormatter = dateFormatter
    }
    func formatted(date: Date) -> String {
        dateFormatter?.dateFormat = "dd/MM/yyyy"
        return dateFormatter?.string(from: date) ?? ""
    }
}
