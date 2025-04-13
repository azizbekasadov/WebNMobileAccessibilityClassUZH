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
    
    fileprivate static func dateFormatterShort(date: Date) -> String {
        DateFormatter.localizedString(
            from: date,
            dateStyle: .none,
            timeStyle: .short
        )
    }
    
    static func format(date: Date) -> String {
        DateFormatter.dateFormatter.string(from: date)
    }
}

extension Date {
    enum FormatSemantics {
        case usual
        case short
    }
    
    func format(
        _ semantics: FormatSemantics = .usual
    ) -> String {
        switch semantics {
        case .usual:
            DateFormatter.format(date: self)
        case .short:
            DateFormatter.dateFormatterShort(date: self)
        }
    }
}
