//
//  DateExtension.swift
//  BitBucket
//
//  Created by sriram on 23/05/21.
//

import Foundation

extension Date {
    static func getFormattedDate(string: String?) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"
        guard let dateStr = string else { return "" }
        if let date: Date = formatter.date(from: dateStr) {
        return dateFormatterPrint.string(from: date);
        }
        return ""
    }
}
