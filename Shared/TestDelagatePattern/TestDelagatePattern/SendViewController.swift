//
//  ViewController.swift
//  TestDelagatePattern
//
//  Created by 이예슬 on 8/9/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit

protocol SendDataDelegate{
    
    func sendData(data: String) // 메서드 정의만 해주세요.
}

class SendViewController: UIViewController {
    
    @IBOutlet weak var myTextField : UITextField!
    
    var delegate: SendDataDelegate? //프로토콜 타입의 변수
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    
    }
    
    @IBAction func myButtoClicked(_ sender : Any){
        
        if let data = myTextField.text{
            
            delegate?.sendData(data:data) //sendData에 우리가 원하는 데이터를 넣어 호출한다.
            self.dismiss(animated:true, completion:nil)
            
        }
    }
  
}

