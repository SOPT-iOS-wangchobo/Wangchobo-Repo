//
//  ThemaVC.swift
//  CustomTopTab
//
//  Created by 이주혁 on 2020/07/03.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class ThemaVC: UIViewController {
    @IBOutlet var textField: UITextField!
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        textField.becomeFirstResponder()
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        // Do any additional setup after loading the view.
        
    }
    
    @objc func textFieldDidChange() {
        guard let count = self.textField.text?.count else {
            return
        }
        self.label.text = "\(count)개"
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

extension ThemaVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return true
    }
    

}
