//
//  ViewController.swift
//  Swift_data_passing_exercise
//
//  Created by 송지훈 on 2020/09/06.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit

class ViewController: UIViewController,MyProtocol {

    
    
    
    
    @IBOutlet weak var propertyTextField: UITextField!
    @IBOutlet weak var segueTextField: UITextField!
    @IBOutlet weak var propertyFunctionTextLabel: UILabel!
     @IBOutlet weak var delegationTextField: UILabel!
     @IBOutlet weak var closureTextField: UILabel!

    @IBOutlet weak var notificationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    
    
    // MARK:- 1. 프로퍼티를 이용해서 서로 data 주고받기(A->B)
    @IBAction func first(_ sender: Any) {
        
        
        guard let vc =  storyboard?.instantiateViewController(identifier: "secondViewController") as? SecondViewController else
        { return }
        
        
        vc.text = self.propertyTextField.text ?? ""
        
        // 이 프로퍼티에 접근해서 데이터를 저장했다고 그 자체로 저장되는 것이 아니라,
        // 정확한 데이터의 전달은 이후 push 하면서 일어나게 된다
        
        
    
        
    }
    // MARK:- 2. 세그를 이용해서 서로 data 주고받기(스토리보드에서)

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ThridViewController {
            let vc = segue.destination as? ThridViewController
            vc?.text = self.segueTextField.text ?? ""
        }
        
        

    }
    
    // MARK:- 3. 프로퍼티와 함수를 이용해서 data 받기(A<-B)
    
    func onThridVCAction(data : String)
    {
        self.propertyFunctionTextLabel.text = data
    }
    
    
    @IBAction func thrid(_ sender: Any) {
        
        guard let vc =  storyboard?.instantiateViewController(identifier: "fourthViewController") as? FourthViewController else
        { return }
        
        vc.mainVC = self
        
        self.navigationController!.pushViewController(vc, animated: true)

        
    }
    // MARK:- 4. delegation 이용해서 data 받기
    @IBAction func fourth(_ sender: Any) {
        
        guard let vc =  storyboard?.instantiateViewController(identifier: "fifthViewController") as? FifthViewController else
        { return }
        vc.delegate = self
        
        
        self.navigationController!.pushViewController(vc, animated: true)
        
    }
    
    
    func protocolData(dataSent: String) {
        self.delegationTextField.text = dataSent
    }
    
    
    // MARK:- 5. closure 이용해서 data 받기
    @IBAction func fifth(_ sender: Any) {
        
        guard let vc =  storyboard?.instantiateViewController(identifier: "sixthViewController") as? SixthViewController else
        { return }
        
        vc.completionHandler =
            {
                text in
                
                
                
                self.closureTextField.text = text
                return text
        }
        
        self.navigationController!.pushViewController(vc, animated: true)
        
        
    }
    
    
    // MARK:- 6.NotificationCenter와 Observer pattern을 이용해서 서로 data 주고받기
    @IBAction func sixth(_ sender: Any) {
    }
    
}

