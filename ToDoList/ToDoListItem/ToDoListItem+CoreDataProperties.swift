//
//  ToDoListItem+CoreDataProperties.swift
//  ToDoList
//
//  Created by Aybike Zeynep Tiryaki on 20.12.2022.
//
//

import Foundation
import CoreData


extension ToDoListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListItem> {
        return NSFetchRequest<ToDoListItem>(entityName: "ToDoListItem")
    }

    @NSManaged public var title: String?
    @NSManaged public var shorDesc: String?
    @NSManaged public var priority: String?

}

extension ToDoListItem : Identifiable {

}
