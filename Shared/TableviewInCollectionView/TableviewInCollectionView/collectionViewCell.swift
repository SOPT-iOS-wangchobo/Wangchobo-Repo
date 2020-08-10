//
//  collectionViewCell.swift
//  TableviewInCollectionView
//
//  Created by 이예슬 on 7/11/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit

class collectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tableView: UITableView!
    override func awakeFromNib(){
        tableView.backgroundColor = .clear
    }
}

