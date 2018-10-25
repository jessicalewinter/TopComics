//
//  PersistenceManager.swift
//  TopComics
//
//  Created by Jessica Lewinter on 24/10/18.
//  Copyright © 2018 Jessica Lewinter. All rights reserved.
//

import UIKit
import CoreData

class PersistenceManager {
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TopComics")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
//    func fetch<T: NSManagedObject>(_ objectType: T.Type) -> [T] {
        
//        let entityName = String(describing: objectType)
//        
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
//        
//        do {
//            let fetchedObjects = try context.fetch(fetchRequest) as? [T]
//            return fetchedObjects ?? [T]()
//            
//        } catch {
//            print(error)
//            return [T]()
//        }
//        
//    }


}
