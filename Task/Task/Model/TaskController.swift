//
//  TaskController.swift
//  Task
//
//  Created by Anthroman on 3/4/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    // Shared Instance
    static let sharedInstance = TaskController()
    
    // Source of Truth
    var fetchedResultsController: NSFetchedResultsController<Task>
    
    init() {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "isComplete", ascending: true)]
        let resultsController: NSFetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: "Complete", cacheName: nil)
        fetchedResultsController = resultsController
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print("There was an error performing the fetch. \(error.localizedDescription)\(#function)")
        }
    }
    
    //MARK: - CRUD
    
    func add(taskWithName name: String, notes: String?, due: Date?) {
        Task(name: name, notes: notes, due: due)
        saveToPersistentStore()
    }
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        task.name = name
        task.notes = notes
        task.due = due
        saveToPersistentStore()
    }
    
    func toggleIsCompleteFor(task: Task) {
        task.isComplete = !task.isComplete
        saveToPersistentStore()
    }
    
    func remove(task: Task) {
        CoreDataStack.context.delete(task)
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        do {
            try CoreDataStack.context.save()
        } catch {
            print("Error saving the data.")
        }
    }
}
