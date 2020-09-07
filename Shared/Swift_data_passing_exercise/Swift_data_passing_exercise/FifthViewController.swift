//
//  FifthViewController.swift
//  Swift_data_passing_exercise
//
//  Created by 송지훈 on 2020/09/06.
//  Copyright © 2020 송지훈. All rights reserved.
//

import UIKit

protocol MyProtocol {
    func protocolData(dataSent : String)
}

class FifthViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    var delegate : MyProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        self.delegate?.protocolData(dataSent: self.textField.text ?? "")
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
