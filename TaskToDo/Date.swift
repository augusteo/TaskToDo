//
//  Date.swift
//  TaskToDo
//
//  Created by Vic Zhou on 15/09/2014.
//  Copyright (c) 2014 SaviumStudios. All rights reserved.
//

import Foundation

class Date {
    class func from(#year:Int, month:Int, day:Int) -> NSDate {
        var c = NSDateComponents()
        c.year = year
        c.month = month
        c.day = day
        
        var gregorian = NSCalendar(identifier: NSGregorianCalendar)
        
        return gregorian.dateFromComponents(c)!
    }
    
    class func toString(#date:NSDate) -> String {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "dd/MM/yy"
        
        return dateStringFormatter.stringFromDate(date)
    }
}