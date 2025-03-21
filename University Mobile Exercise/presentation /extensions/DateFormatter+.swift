//
//  DateFormatter+.swift
//  University Mobile Exercise
//
//  Created by Azizbek Asadov on 21.03.2025.
//

import Foundation

extension DateFormatter {
    fileprivate static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        return dateFormatter
    }()
    
    static func format(date: Date) -> String {
        DateFormatter.dateFormatter.string(from: date)
    }
}

extension Date {
    func format() -> String {
        DateFormatter.format(date: self)
    }
}
