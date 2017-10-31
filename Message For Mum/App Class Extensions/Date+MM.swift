//
//  Date+MM.swift
//  Message For Mum
//
//  Created by Lana Shatonova on 29/10/17.
//  Copyright © 2017 L. All rights reserved.
//

import Foundation

// MARK: - Date

public extension Date {
    
    init(day: Int, month: Int, year: Int) {
        let components: DateComponents = DateComponents(year: year, month: month, day: day)
        self = Calendar.current.date(from: components)!
    }
    
    // MARK: - Properties
    
    public var day: Int {
        return Calendar.current.dateComponents([.day], from: self).day!
    }
    
    public var month: Int {
        return Calendar.current.dateComponents([.month], from: self).month!
    }
    
    public var year: Int {
        return Calendar.current.dateComponents([.year], from: self).year!
    }
    
    // MARK: - Fucntions
    
    func dateString() -> String {
        return MMDateFormatter.shared.string(from: self, format: "d MMMM YYYY")
    }
    
    func monthString() -> String {
        return MMDateFormatter.shared.string(from: self, format: "MMMM")
    }
    
    func weekdayFullString() -> String {
        return MMDateFormatter.shared.string(from: self, format: "EEEE")
    }
    
    func weekdayShortString() -> String {
        return MMDateFormatter.shared.string(from: self, format: "E")
    }
    
    func weekday() -> MMWeekday {
        let i: Int = Calendar.current.component(.weekday, from: self)
        let rawValue: Int = i - 2
        return MMWeekday(rawValue: rawValue >= 0 ? rawValue : MMWeekday.count.rawValue + rawValue) ?? MMWeekday.count
    }
}

public class MMDateFormatter: DateFormatter {
    
    public static var shared: MMDateFormatter = MMDateFormatter()
    
    public override init() {
        super.init()
        locale = Locale(identifier: "ru_RU")
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func string(from date: Date, format: String) -> String {
        dateFormat = format
        return string(from: date)
    }
}


// MARK: - Weekdays

public enum MMWeekday: Int {
    
    case monday = 0
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
    
    case count
    
    // MARK: - Functions
    
    func title() -> String? {
        let titles: [String] = MMDateFormatter.shared.shortStandaloneWeekdaySymbols
        return rawValue < titles.count ? titles[rawValue] : nil
    }
}


// MARK: - Months

public enum MMMonth: Int {
    case january = 0
    case february
    case march
    case april
    case may
    case june
    case july
    case august
    case september
    case october
    case november
    case december
    
    case count
    
    // MARK: - Properties
    
    public var firstDay: Date {
        return Date(day: 1, month: rawValue + 1, year: MMApp.year)
    }
    
    public var firstDayWeekday: MMWeekday {
        return firstDay.weekday()
    }
    
    public var numberOfDays: Int {
        switch self {
        case .january, .march, .may, .july, .august, .october, .december:
            return 31
        case .april, .june, .september, .november:
            return 30
        case .february:
            return 28
        default:
            return 0
        }
    }
    
    public var numberOfWeeks: Int {
        return (firstDayWeekday.rawValue + numberOfDays) / MMWeekday.count.rawValue + ((firstDayWeekday.rawValue + numberOfDays) % MMWeekday.count.rawValue > 0 ? 1 : 0) 
    }
    
    // MARK: - Functions
    
    public func title() -> String? {
        let titles: [String] = MMDateFormatter.shared.standaloneMonthSymbols
        return rawValue < titles.count ? titles[rawValue] : nil
    }
}
