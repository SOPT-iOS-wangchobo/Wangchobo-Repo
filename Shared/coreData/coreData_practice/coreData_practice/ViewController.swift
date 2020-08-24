//
//  ViewController.swift
//  coreData_practice
//
//  Created by 송지훈 on 2020/08/23.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    


    override func viewDidLoad() {
        super.viewDidLoad()
    
        saveNewUser(1, name: "Danny")
//        deleteUser(1)
        getAllUsers()
    }
    
    fileprivate func getAllUsers() {
        let users: [Contant] = CoreDataManager.shared.getUsers()
        let userNames: [String] = users.map({$0.name!})
        let userDevices: [String]? = users.filter({$0.name == "Danny"}).first?.devices
        print("allUsers = \(userNames)")
        print("Danny's Devices = \(userDevices)")
    }
    
    // 새로운 유저 등록
    fileprivate func saveNewUser(_ id: Int64, name: String) {
        CoreDataManager.shared
            .saveUser(id: id, name: name, age: 16, date: Date(),
                      devices: [Devices.iMac.rawValue, Devices.iPad.rawValue]) { onSuccess in
                        print("saved = \(onSuccess)")
        }
    }
    
    fileprivate func deleteUser(_ id: Int64) {
        CoreDataManager.shared.deleteUser(id: id) { onSuccess in
            print("deleted = \(onSuccess)")
        }
    }
}


