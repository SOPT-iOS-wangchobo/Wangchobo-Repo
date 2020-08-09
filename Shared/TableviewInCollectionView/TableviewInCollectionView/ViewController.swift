//
//  ViewController.swift
//  TableviewInCollectionView
//
//  Created by 이예슬 on 7/11/20.
//  Copyright © 2020 이예슬. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    var currentIndex : Int = -1
    
    @IBOutlet weak var themeButton: UIButton!
    @IBOutlet weak var sentenceButton: UIButton!
    @IBOutlet weak var cvTop: NSLayoutConstraint!
    
    @IBAction func make(_ sender: Any) {
        
        cvTop.constant += 10
        
        collectionView.reloadData()
        
    }
    
    @IBAction func touchUpTheme(_ sender: Any) {
        let indexPath = IndexPath(row: 0, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .right, animated: true)
        
    }
    @IBAction func touchUpSentence(_ sender: Any) {
        let indexPath = IndexPath(row: 1, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
    }
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .yellow
        
    }
    
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as? collectionViewCell else{ return UICollectionViewCell()}
        if indexPath.item == 0
        {
            cell.backgroundColor = .blue
        }
        else if indexPath.item == 1 {
            cell.backgroundColor = .darkGray
        }
        else {
            cell.backgroundColor = .brown
        }
        cell.tableView.delegate = self
        cell.tableView.dataSource = self
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == collectionView{
            currentIndex = Int(collectionView.contentOffset.x / collectionView.frame.width)
            print()
            
            //            let visibleItems : NSArray = collectionView.indexPathsForVisibleItems as NSArray
            //            let currentItem : IndexPath = visibleItems.object(at: 0) as! IndexPath
            //            print(currentItem)
            if currentIndex == 0{
                themeButton.setTitleColor(.green, for: .normal)
                sentenceButton.setTitleColor(.lightGray,for:.normal)
            }
            else{
                
                sentenceButton.setTitleColor(.green, for: .normal)
                themeButton.setTitleColor(.lightGray,for:.normal)
            }
        }
        
    }
}


extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath)
        
        return cell
    }
    
}

