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
    var delegate : CoreDataDelegate?
    
    
    func getAllItems() {
        
        do {
            
            models = try context.fetch(ToDoListItem.fetchRequest())
            delegate?.reloadToDoList()
            
        }
        
        catch {
            
            print("error")
            
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
