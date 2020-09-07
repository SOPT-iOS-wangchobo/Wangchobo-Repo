//
//  SixthViewController.swift
//  Swift_data_passing_exercise
//
//  Created by 송지훈 on 2020/09/07.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit

class SixthViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    

    var completionHandler: ((String) -> (String))?
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func buttonClicked(_ sender: Any) {
        _ = completionHandler?(self.textField.text ?? "")   
        self.navigationController?.popViewController(animated: true)
    }   
    

}
