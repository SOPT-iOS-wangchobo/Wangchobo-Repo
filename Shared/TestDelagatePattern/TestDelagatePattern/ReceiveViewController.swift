//
//  ReceiveViewController.swift
//  TestDelagatePattern
//
//  Created by 이예슬 on 8/9/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit

class ReceiveViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "modal"{
        
            let viewController : SendViewController = segue.destination as! SendViewController
            viewController.delegate = self // 대리자 위임. sendVC의 일을 대리해서 내가(receiveVC) 하겠다.
    
        }
    }
}

extension ReceiveViewController : SendDataDelegate{ //SendDataDelegate라는 프로토콜을 채택하겠다!
    
    func sendData(data: String) { //프로토콜을 준수해야함. sendData를 옵셔널로 하지 않았기 때문에.
        myLabel.text = data
    }
}
