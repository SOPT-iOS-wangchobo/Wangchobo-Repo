//
//  FourthViewController.swift
//  Swift_data_passing_exercise
//
//  Created by 송지훈 on 2020/09/06.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    
    var mainVC : ViewController?

    @IBOutlet weak var dataTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func buttonClicked(_ sender: Any) {

        mainVC?.onThridVCAction(data: self.dataTextField.text ?? "")
        
        self.navigationController?.popViewController(animated: true)
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
