//
//  ViewController.swift
//  CustomTopTab
//
//  Created by 이주혁 on 2020/07/03.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tabBarCollectionView: UICollectionView!
    @IBOutlet var underBarView: UIView!
    
    
    let menuItem = ["Menu1", "Menu2"]
    var pageInstance: PageVC?
    var observingList: [NSKeyValueObservation] = []
    var underBarConstraintList: [NSLayoutConstraint] = []   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarCollectionView.delegate = self
        tabBarCollectionView.dataSource = self

        underBarView.translatesAutoresizingMaskIntoConstraints = false
        let constraintHeight = underBarView.heightAnchor.constraint(equalToConstant: 2.0)
        let constraintTop = underBarView.topAnchor.constraint(equalTo: tabBarCollectionView.bottomAnchor)
        let constraintWidth = underBarView.widthAnchor.constraint(equalToConstant: tabBarCollectionView.frame.width / 2)
        print(view.frame.width)
        print(tabBarCollectionView.frame.width)

        NSLayoutConstraint.activate([constraintHeight, constraintTop,constraintWidth])
        
        collectionView(tabBarCollectionView, didSelectItemAt: IndexPath(item: 0, section: 0))
        tabBarCollectionView.selectItem(at: IndexPath(item: 0, section: 0),
                                        animated: false,
                                        scrollPosition: .bottom)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        observingList.forEach { $0.invalidate() }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "pageSegue" {
            pageInstance = segue.destination as? PageVC
            
            //ob는 NSKeyValueObservation
            let ob = pageInstance?
                .keyValue
                .observe(\.curPresentViewIndex,
                         options: [.new, .old]) {
                            [weak self] (changeObject, value) in
                            
                            self?.tabBarCollectionView.selectItem(at: IndexPath(item: changeObject.curPresentViewIndex, section: 0),
                                                                  animated: false,
                                                                  scrollPosition: .bottom)
                            
                            if (changeObject.curPresentViewIndex == 0){
                                UIView.animate(withDuration: 0.3){
                                    self!.underBarView.transform = CGAffineTransform(translationX:0 ,y: 0)
                                }
                            }
                            else {
                                UIView.animate(withDuration: 0.3){
                                    self!.underBarView.transform = CGAffineTransform(translationX:(self?.tabBarCollectionView.frame.width)! / 2 ,y: 0)
                                }
                            }
                            
                            
                            print("kvo test")
                            
            }
            
            observingList.append(ob!)
        }
    }
}

extension ViewController: UICollectionViewDelegate {
    //메뉴탭바에서 아이템 눌렀을 때 페이지뷰컨에 뷰컨 띄우기
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let item = indexPath.item
        
        guard let pageInstance = self.pageInstance else {
            return
        }

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuItemCVCell.identifier, for: indexPath) as? MenuItemCVCell else {
            return
        }


        NSLayoutConstraint.activate(self.underBarConstraintList)

        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        print("item : \(item)")
        print([pageInstance.vcArr![item]])
        if item == 0 {
            
            pageInstance.setViewControllers([pageInstance.vcArr![item]], direction: .reverse, animated: true, completion: nil)
            pageInstance.keyValue.curPresentViewIndex = 0
        }
        else if item == 1 {
            pageInstance.setViewControllers([pageInstance.vcArr![item]], direction: .forward, animated: true, completion: nil)
            pageInstance.keyValue.curPresentViewIndex = 1
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuItemCVCell.identifier,
                                                            for: indexPath) as? MenuItemCVCell
            else {
                return UICollectionViewCell()
        }
        cell.menuLabel.text = menuItem[indexPath.row]
        
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
//    UIEdgeInset

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
