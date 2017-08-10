//
//  Day.swift
//  WhatsNext
//
//  Created by MetroStar on 8/9/17.
//  Copyright © 2017 TamerBader. All rights reserved.
//

import UIKit

class Day: NSObject {
    
    private var weekday:Weekday!
    private var month:Month!
    private var dayNumber:Int!
    private var dayTimestamp:Date!
    private lazy var tasks:Array<Task> = Array<Task>()
    
    var Weekday:String {
        get {return weekday.rawValue}
    }
    
    var Month: String {
        get{return month.rawValue}
    }
    
    var DayNumber: Int {
        get{return dayNumber}
        set{dayNumber = newValue}
    }
    
    var Timestamp: Date {
        get{return dayTimestamp}
    }
    
    var Tasks: [Task] {
        get{return tasks}
    }
    
    init(timestamp:Date) {
        dayTimestamp = timestamp
        let result = Day.extractDayDetailsFromTimestamp(timestamp: timestamp)
        dayNumber = result[0] as! Int
        weekday = result[1] as! Weekday
        month = result[2] as! Month
        
    }
    
    func addTask(newTask: Task) {
        tasks.append(newTask)
    }
    
    static func extractDayDetailsFromTimestamp (timestamp:Date) -> [Any] {
        var dayDetails:Array<Any> = Array<Any>()
        
        let calendar:Calendar = Calendar.current
        
        let components = calendar.dateComponents([.day, .month, .weekday], from: timestamp)
        let day = components.day
        let month = components.month
        let weekday = components.weekday
        
        let currentWeekday:Weekday
        let currentMonth:Month
        
        print("Day is \(day ?? 0) and month is \(month ?? 0) weekday is \(weekday ?? 0)")
        
        switch weekday! {
        case 1:
            currentWeekday = .SUNDAY
        case 2:
            currentWeekday = .MONDAY
        case 3:
            currentWeekday = .TUESDAY
        case 4:
            currentWeekday = .WEDNESDAY
        case 5:
            currentWeekday = .THURSDAY
        case 6:
            currentWeekday = .FRIDAY
        case 7:
            currentWeekday = .SATURDAY
        default:
            currentWeekday = .SUNDAY
            print("UNKNOWN DAY")
        }
        
        switch month! {
        case 1:
            currentMonth = .JANUARY
        case 2:
            currentMonth = .FEBRUARY
        case 3:
            currentMonth = .MARCH
        case 4:
            currentMonth = .APRIL
        case 5:
            currentMonth = .MAY
        case 6:
            currentMonth = .JUNE
        case 7:
            currentMonth = .JULY
        case 8:
            currentMonth = .AUGUST
        case 9:
            currentMonth = .SEPTEMBER
        case 10:
            currentMonth = .OCTOBER
        case 11:
            currentMonth = .NOVEMBER
        case 12:
            currentMonth = .DECEMBER
        default:
            currentMonth = .JANUARY
            print("UNKNOWN Month")
        }
        
        dayDetails.append(day!)
        dayDetails.append(currentWeekday)
        dayDetails.append(currentMonth)
        
        
        
        return dayDetails
        
    }
    
    

}
