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
    
        
        print("d")
        saveNewUser(name: "지훈", phoneNumber: "01030667236", shortcut: 1)
        saveNewUser(name: "가나", phoneNumber: "010888321", shortcut: 2)
        saveNewUser(name: "다라", phoneNumber: "010306545423", shortcut: 3)
        
        //각각 유저 데이터를 저장하고,

        //        deleteUser(1)
        getAllUsers()
    }
    
    
    //모든 유저 보기
    
    fileprivate func getAllUsers() {
        let users: [Contact] = CoreDataManager.shared.getUsers()
        let userNames: [String] = users.map({$0.name!})                             //$0 -> 클로저의 첫번째 인자를 참조하는 것$
        let userPhoneNumbers : [String] = users.map({$0.phoneNumber!})
        let userShortCuts : [Int16] = users.map({$0.shortCut})

        print("allUsers = \(userNames)")
        print("allUsers phoneNumber = \(userPhoneNumbers)")
        print("allUsers shortCuts = \(userShortCuts)")
        
        
    }
    
    
    // 새로운 유저 등록
    fileprivate func saveNewUser( name: String, phoneNumber: String, shortcut : Int16){
        CoreDataManager.shared
            .saveUser(name: name, phoneNumber: phoneNumber, shortCut: shortcut) { onSuccess in
                        print("saved = \(onSuccess)")
                        
        }
    }
    
    
    
    ///  접근수준               키워드                                 범위

    ///개방 접근수준            open                   모듈 외부에서도 접근 가능
    ///공개 접근수준            public                  모듈 외부에서도 접근 가능
    ///내부 접근수준            internal                하나의 모듈 내부에서만 접근 가능
    ///파일내부 접근수준      fileprivate            하나의 파일 내에서만 접근 가능   --> 이걸 사용함 여기에서는 !!
    ///비공개 접근수준         private                 정의한 블록 내부에서만 접근 가능
    

}


