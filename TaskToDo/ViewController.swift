//
//  ViewController.swift
//  TaskToDo
//
//  Created by Vic Zhou on 15/09/2014.
//  Copyright (c) 2014 SaviumStudios. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var taskTableView: UITableView!
    
    var taskArray:[TaskModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let task1 = TaskModel(task: "Study French", description: "Verbs", date: Date.from(year: 2014, month: 01, day: 25))
        let task2 = TaskModel(task: "Foo", description: "Bar", date: Date.from(year: 2014, month: 01, day: 25))
        let task3 = TaskModel(task: "Cooking", description: "Think of what to cook tonight", date: Date.from(year: 2014, month: 10, day: 15))
        let task4 = TaskModel(task: "Exercise", description: "Maybe just do kettlebell swings", date: Date.from(year: 2014, month: 10, day: 15))
        taskArray = [task1, task2, task3, task4]
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.taskTableView.reloadData()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showTaskDetail" {
            let detailVC:TaskDetailViewController = segue.destinationViewController as TaskDetailViewController
            let taskIndex:NSIndexPath = self.taskTableView.indexPathForSelectedRow()!
            let selectedTask = taskArray[taskIndex.row]
            detailVC.detailTaskModel = selectedTask
            detailVC.isNew = false
            detailVC.mainVC = self
        } else if segue.identifier == "showAddTask" {
            let detailVC:TaskDetailViewController = segue.destinationViewController as TaskDetailViewController
            detailVC.mainVC = self
            detailVC.isNew = true
        }
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("taskCell") as TaskTC
        
        cell.taskLabel.text = taskArray[indexPath.row].task
        cell.descriptionLabel.text = taskArray[indexPath.row].description
        cell.dateLabel.text = Date.toString(date: taskArray[indexPath.row].date)
        
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showTaskDetail", sender: self)
    }

}
