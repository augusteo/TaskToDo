//
//  TaskDetailViewController.swift
//  TaskToDo
//
//  Created by Vic Zhou on 15/09/2014.
//  Copyright (c) 2014 SaviumStudios. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class TaskDetailViewController: UIViewController {
 
    @IBOutlet weak var taskField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var detailTaskModel: TaskModel!
    var mainVC: ViewController!
    var isNew = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !isNew{
            taskField.text = detailTaskModel.task
            descriptionField.text = detailTaskModel.description
            datePicker.date = detailTaskModel.date
        }
    }
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func saveButtonPressed(sender: AnyObject) {
        //CoreData
        let appDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        let managedObjectContext = appDelegate.managedObjectContext
        let entityDescription = NSEntityDescription.entityForName("TaskModel", inManagedObjectContext: managedObjectContext!)
        let task = TaskModel(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext)

        task.task = taskField.text
        task.subtask = descriptionField.text
        task.date = datePicker.date
        task.isCompleted = false
        
        
        appDelegate.saveContext()
        
//        if isNew{
//            self.mainVC.baseArray[0].append(updatedTask)
//        } else {
//            mainVC.baseArray[0][mainVC.taskTableView.indexPathForSelectedRow()!.row] = updatedTask
//        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}