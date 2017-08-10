//
//  Task.swift
//  WhatsNext
//
//  Created by MetroStar on 8/9/17.
//  Copyright © 2017 TamerBader. All rights reserved.
//

import UIKit

class Task: NSObject {
    private var taskDescription:String!
    private var taskBeginningTime:Date!
    private var taskEndingTime:Date?
    
    var Description: String {
        get{return taskDescription}
        set{taskDescription = newValue}
    }
    
    var BeginningTime: Date {
        get{return taskBeginningTime}
        set{taskBeginningTime = newValue}
    }
    
    var EndingTime: Date {
        get{return taskEndingTime!}
        set{taskEndingTime = newValue}
    }
    
    init(description:String, beginningTime: Date) {
        taskDescription = description
        taskBeginningTime = beginningTime
    }
    
    
}
