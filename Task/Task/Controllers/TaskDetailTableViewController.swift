//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Anthroman on 3/4/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {

    //MARK: - Outlets
    
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    
    //MARK: - Properties
    
    var task: Task?
    var dueDateValue: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        dueDateTextField.inputView = dueDatePicker
    }

    //MARK: - Actions
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let name = taskNameTextField.text else {return}
        let notes = notesTextView.text
        let date = dueDatePicker.date
        
        if let task = task {
            TaskController.sharedInstance.update(task: task, name: name, notes: notes, due: date)
        } else {
            TaskController.sharedInstance.add(taskWithName: name, notes: notes, due: date)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        self.dueDateValue = sender.date
        self.dueDateTextField.text = sender.date.formatted
    }
    
    @IBAction func userTappedView(_ sender: UITapGestureRecognizer) {
        self.dueDateTextField.resignFirstResponder()
        self.taskNameTextField.resignFirstResponder()
        self.notesTextView.resignFirstResponder()
    }
    
    private func updateViews() {
        guard let task = task, isViewLoaded else {return}
        title = task.name
        taskNameTextField.text = task.name
        dueDateTextField.text = (task.due as Date?)?.formatted
        notesTextView.text = task.notes
    }
}
