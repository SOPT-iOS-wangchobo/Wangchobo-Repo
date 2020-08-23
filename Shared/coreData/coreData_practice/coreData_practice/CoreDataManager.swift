//
//  CoreDataManager.swift
//  coreData_practice
//
//  Created by 송지훈 on 2020/08/23.
//  Copyright © 2020 송지훈. All rights reserved.
//


import UIKit
import CoreData

class CoreDataManager {
    static let shared: CoreDataManager = CoreDataManager()
    
    let appDelegate: AppDelegate? = UIApplication.shared.delegate as? AppDelegate
    lazy var context = appDelegate?.persistentContainer.viewContext
    
    let modelName: String = "Contant"
    
    func getUsers(ascending: Bool = false) -> [Contant] {
        var models: [Contant] = [Contant]()
        
        if let context = context {
            let idSort: NSSortDescriptor = NSSortDescriptor(key: "id", ascending: ascending)
            let fetchRequest: NSFetchRequest<NSManagedObject>
                = NSFetchRequest<NSManagedObject>(entityName: modelName)
            fetchRequest.sortDescriptors = [idSort]
            
            do {
                if let fetchResult: [Contant] = try context.fetch(fetchRequest) as? [Contant] {
                    models = fetchResult
                }
            } catch let error as NSError {
                print("Could not fetch🥺: \(error), \(error.userInfo)")
            }
        }
        return models
    }
    
    func saveUser(name : String, phoneNumber : String, shortCut : Int16, onSuccess: @escaping ((Bool) -> Void)) {
        if let context = context,
            let entity: NSEntityDescription
            = NSEntityDescription.entity(forEntityName: modelName, in: context) {
            
            if let user: Contant = NSManagedObject(entity: entity, insertInto: context) as? Contant {
                user.name = name
                user.phoneNumber = phoneNumber
                user.shortcutNumber = shortCut
                
                contextSave { success in
                    onSuccess(success)
                }
            }
        }
    }
    

}

extension CoreDataManager {
    fileprivate func filteredRequest(id: Int64) -> NSFetchRequest<NSFetchRequestResult> {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult>
            = NSFetchRequest<NSFetchRequestResult>(entityName: modelName)
        fetchRequest.predicate = NSPredicate(format: "id = %@", NSNumber(value: id))
        return fetchRequest
    }
    
    fileprivate func contextSave(onSuccess: ((Bool) -> Void)) {
        do {
            try context?.save()
            onSuccess(true)
        } catch let error as NSError {
            print("Could not save🥶: \(error), \(error.userInfo)")
            onSuccess(false)
        }
    }
}
