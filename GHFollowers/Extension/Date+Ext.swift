//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Edson Brandon on 05/12/24.
//

import Foundation

extension Date {
    func convertToMonthYearFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: self)
    }
}
