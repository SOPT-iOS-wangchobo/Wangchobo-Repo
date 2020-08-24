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
    
    //viewContext 란?
    // : The managed object context associated with the main queue. (read-only)
    let modelName: String = "Contact"

    func getUsers(ascending: Bool = false) -> [Contact] {
        var models: [Contact] = [Contact]()
        if let context = context {
            let idSort: NSSortDescriptor = NSSortDescriptor(key: "name", ascending: ascending)
            //name 의 키값으로 내림차순으로 정리하는 NSSortDescriptor을 선언했다 !
            // ascending이 false 면 내림차순, true면 오름차순
            let fetchRequest: NSFetchRequest<NSManagedObject>
                = NSFetchRequest<NSManagedObject>(entityName: modelName)
            // modelName을 가진 entity를 기준으로 영구저장소에서 데이터를 꺼내오는 request
            
            //NSFetchRequest 란?
            // A description of search criteria used to retrieve data from a persistent store.
            // 라고 애플이 그러네요..
            
            fetchRequest.sortDescriptors = [idSort]
            
            //아까 modelName으로 꺼내온 entity에서 정렬자를 아까 해둔 'name'순으로 내림차순으로 설정해두고,
            
            
            do {
                if let fetchResult: [Contact] = try context.fetch(fetchRequest) as? [Contact] {
                    models = fetchResult
                    // 아까 생성해둔 models 싱글턴 객체에다가 fetchResult들의 값들을 반환시켜 넣는다 !
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
            
            //entity에 modelname으로 접근후에
            
            if let user: Contact = NSManagedObject(entity: entity, insertInto: context) as? Contact {
                
                user.name = name
                user.phoneNumber = phoneNumber
                user.shortCut = shortCut
                
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
