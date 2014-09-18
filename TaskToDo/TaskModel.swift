//
//  TaskModel.swift
//  TaskToDo
//
//  Created by Vic Zhou on 16/09/2014.
//  Copyright (c) 2014 SaviumStudios. All rights reserved.
//

import Foundation
import CoreData

@objc (TaskModel)
class TaskModel: NSManagedObject {

    @NSManaged var isCompleted: NSNumber
    @NSManaged var task: String
    @NSManaged var subtask: String
    @NSManaged var date: NSDate

}
