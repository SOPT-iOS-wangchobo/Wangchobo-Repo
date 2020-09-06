//
//  ViewController.swift
//  TestAnimation
//
//  Created by 이예슬 on 9/6/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var yellowView: UIView!

    @IBOutlet weak var yellowViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var yellowViewLeading: NSLayoutConstraint!
    @IBOutlet weak var yellowViewWidth: NSLayoutConstraint!
    @IBOutlet weak var yellowViewHeight: NSLayoutConstraint!
    @IBOutlet weak var yapButton: UIButton!
    @IBOutlet weak var yapyapButton: UIButton!
    @IBAction func viewAnimate1(_ sender: Any){
        
        if yapButton.isSelected{
            self.yellowViewTopConstraint.constant = 100
            yapButton.isSelected = false
        }
        else{
            self.yellowViewTopConstraint.constant = 300
            yapButton.isSelected = true
        }

        //yellowView.setNeedsUpdateConstraints()
        UIView.animate(withDuration: 0.5){
            //바뀐 오토레이아웃을 적용
            self.view.layoutIfNeeded()
        }
    }
    @IBAction func viewAnimate2(_ sender: Any){
        print(yapyapButton.isSelected)

        if yapyapButton.isSelected{
            self.yellowViewHeight.constant = 134
            self.yellowViewWidth.constant = 175
            yapyapButton.isSelected = false
        }
        else{
            self.yellowViewHeight.constant = 160
            self.yellowViewWidth.constant = 200
            yapyapButton.isSelected = true
        }
        yellowView.setNeedsUpdateConstraints()

        UIView.animate(withDuration: 0.3){
            self.view.layoutIfNeeded()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

