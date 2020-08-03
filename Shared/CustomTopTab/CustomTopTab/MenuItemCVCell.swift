//
//  MenuItemCVCell.swift
//  CustomTopTab
//
//  Created by 이주혁 on 2020/07/03.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class MenuItemCVCell: UICollectionViewCell {
    static let identifier = "MenuItemCVCell"
    
    
    @IBOutlet var menuLabel: UILabel!
    
    override var isSelected: Bool {
        didSet {
            menuLabel.textColor = isSelected ? .green : .black
        }
    }
    
}
