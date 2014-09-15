//
//  TaskDetailViewController.swift
//  TaskToDo
//
//  Created by Vic Zhou on 15/09/2014.
//  Copyright (c) 2014 SaviumStudios. All rights reserved.
//

import Foundation
import UIKit

class TaskDetailViewController: UIViewController {
 
    @IBOutlet weak var taskField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var detailTaskModel: TaskModel!
    var mainVC: ViewController!
    var isNew = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isNew{
            
        } else {
            taskField.text = detailTaskModel.task
            descriptionField.text = detailTaskModel.description
            datePicker.date = detailTaskModel.date
        }
    }
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func saveButtonPressed(sender: AnyObject) {
        var updatedTask = TaskModel(task: taskField.text, description: descriptionField.text, date: datePicker.date)
        
//        print("\(mainVC)")
        if isNew{
            self.mainVC.taskArray += updatedTask
        } else {
            mainVC.taskArray[mainVC.taskTableView.indexPathForSelectedRow().row] = updatedTask
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}