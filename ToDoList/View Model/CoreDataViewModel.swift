//
//  CoreDataModel.swift
//  ToDoList
//
//  Created by Aybike Zeynep Tiryaki on 20.12.2022.
//

import UIKit
import CoreData

protocol CoreDataDelegate {
    func reloadToDoList()
}

class CoreDataModel {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var models = [ToDoListItem]()
    var lowLevelItem = [ToDoListItem]()
    var mediumLevelItem = [ToDoListItem]()
    var highLevelItem = [ToDoListItem]()
    var delegate : CoreDataDelegate?
    let highLevel = "HIGH"
    let mediumLevel = "MEDIUM"
    let lowLevel = "LOW"
    
    func getAllItems() {
        
        do {
            
            models = try context.fetch(ToDoListItem.fetchRequest())
            delegate?.reloadToDoList()
        }
        
        catch {
            
            print("error")
            
        }
    }
    
    func getHıghLevelPriorityToDo() {
        
        let predicateHighLevel = NSPredicate(format: "priority = %@", highLevel)
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"ToDoListItem")
        fetchRequest.predicate = predicateHighLevel
        
        do {
            
            let fetchedResults = try context.fetch(fetchRequest) as! [ToDoListItem]
            highLevelItem = fetchedResults
            
        } catch let err {
            print("Error in updating",err)
        }
        
        DispatchQueue.main.async {
            self.delegate?.reloadToDoList()
            
        }
    }
    
    func getMediumLevelPriorityTodo() {
        
        let predicateMediumLevel = NSPredicate(format: "priority = %@", mediumLevel)
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"ToDoListItem")
        fetchRequest.predicate = predicateMediumLevel
        
        do {
            let fetchedResults = try context.fetch(fetchRequest) as! [ToDoListItem]
            mediumLevelItem = fetchedResults
            
        } catch let err {
            print("Error in updating",err)
        }
        
        DispatchQueue.main.async {
            self.delegate?.reloadToDoList()
            
        }
    }
    
    func getLowLevelPriorityTodo() {
        
        let predicateLowLevel = NSPredicate(format: "priority = %@", lowLevel)
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:"ToDoListItem")
        fetchRequest.predicate = predicateLowLevel
        
        do {
            
            let fetchedResults = try context.fetch(fetchRequest) as! [ToDoListItem]
            lowLevelItem = fetchedResults
            
        } catch let err {
            print("Error in updating",err)
        }
        
        DispatchQueue.main.async {
            self.delegate?.reloadToDoList()
            
        }
    }
    
    func createItem(title: String, shorDesc: String, priority: String) {
        
        let newItem = ToDoListItem(context: context)
        newItem.title = title
        newItem.shorDesc = shorDesc
        newItem.priority = priority
        
        do {
            
            try context.save()
            getAllItems()
            
        }
        
        catch {
            print("error")
        }
    }
    
    func deleteItem(item: ToDoListItem) {
        context.delete(item)
        
        do {
            
            try context.save()
            getAllItems()
            
        }
        
        catch {
            
            print("error")
        }
    }
    
    func updateItem(item: ToDoListItem, newTitle: String, newShorDesc: String, newPriority: String) {
        
        item.title = newTitle
        item.shorDesc = newShorDesc
        item.priority = newPriority
        
        do {
            
            try context.save()
        }
        
        catch {
            
            print("error")
        }
    }
}
