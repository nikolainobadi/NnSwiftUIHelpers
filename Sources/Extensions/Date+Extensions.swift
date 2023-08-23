//
//  Date+Extensions.swift
//  
//
//  Created by Nikolai Nobadi on 8/23/23.
//

import Foundation

// MARK: - Formatting
public extension Date {
    enum DateFormat: String {
        case shortDate = "MM/dd/yyyy" // Output: "08/23/2023"
        case longDate = "MMMM dd, yyyy" // Output: "August 23, 2023"
        case fullDateWithTime = "EEEE, MMMM dd, yyyy h:mm a" // Output: "Wednesday, August 23, 2023 3:30 PM"
        case timeOnly = "h:mm a" // Output: "3:30 PM"
    }
    
    func formatted(using format: DateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.string(from: self)
    }
}


// MARK: - Getting Dates/Times Based on Current Date
public extension Date {
    var tomorrow: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }
    
    var yesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
    
    var firstDayOfWeek: Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self))!
    }
    
    func createTime(hour: Int, minute: Int, second: Int) -> Date? {
        var components = Calendar.current.dateComponents([.year, .month, .day], from: self)
        components.hour = hour
        components.minute = minute
        components.second = second
        return Calendar.current.date(from: components)
    }
}


// MARK: - Static Methods
public extension Date {
    static func createDate(month: Int, day: Int, year: Int) -> Date? {
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        return Calendar.current.date(from: components)
    }
    
    static func firstDayOfMonth(month: Int, year: Int) -> Date? {
        return createDate(month: month, day: 1, year: year)
    }

    static func lastDayOfMonth(month: Int, year: Int) -> Date? {
        let nextMonth = month == 12 ? 1 : month + 1
        let nextYear = month == 12 ? year + 1 : year
        let firstDayOfNextMonth = createDate(month: nextMonth, day: 1, year: nextYear)!
        return Calendar.current.date(byAdding: .day, value: -1, to: firstDayOfNextMonth)
    }

    static func firstDayOfYear(year: Int) -> Date? {
        return createDate(month: 1, day: 1, year: year)
    }

    static func lastDayOfYear(year: Int) -> Date? {
        return createDate(month: 12, day: 31, year: year)
    }
}
