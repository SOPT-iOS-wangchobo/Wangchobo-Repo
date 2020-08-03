//
//  PageVC.swift
//  CustomTopTab
//
//  Created by 이주혁 on 2020/07/03.
//  Copyright © 2020 이주혁. All rights reserved.
//

import UIKit
@objc class KVOObject : NSObject {
    @objc dynamic var curPresentViewIndex: Int = 0 //관찰 대상
    
}
class PageVC: UIPageViewController {

    //어떠한 객체도 들어갈 수 있는 objc 배열
    let identifiers: NSArray = ["ThemaVC", "SentenceVC"]
    var vcArr: [UIViewController]?
    var keyValue = KVOObject() //keyvalue가 observer 인스턴스
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        //compactMap : NSArray에서 non-nil로 이루어진 array 리턴
        vcArr = identifiers.compactMap {
            let vc = self.storyboard?.instantiateViewController(identifier: $0 as! String)
            return vc
        }
        if let firstVC = vcArr?.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        // Do any additional setup after loading the view.
    }
    
    // 스크롤 방식 변경, inspector Builder에서 변경할 수도 있지만 커스텀 으로 생성하기 때문에 이런식으로 설정
    // 부모 클래스인 uipageviewcontroller의 요구 이니셜라이저 재정의
    required init?(coder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
}

extension PageVC : UIPageViewControllerDelegate {
    //Called after a gesture-driven transition completes.
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        //KVO
        if completed {
            if previousViewControllers[0] is CustomTopTab.ThemaVC {
                self.keyValue.curPresentViewIndex = 1
            }
            else {
                self.keyValue.curPresentViewIndex = 0
            }
        }
    }
    

}

extension PageVC: UIPageViewControllerDataSource {
    //앞쪽에 표시되는 뷰컨
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = vcArr?.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        if previousIndex < 0 {
            return nil
            //return vcArr?.last
        }
        else {
            return vcArr![previousIndex]
        }

        
    }
    // 뒷쪽에 표시할 뷰컨 리턴
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = vcArr?.firstIndex(of: viewController) else {
            
            return nil

        }

        let nextIndex = viewControllerIndex + 1
        if nextIndex >= vcArr!.count {
            return nil
            //return vcArr?.first
            //infinite 할려면 이렇게
        } else {
            return vcArr![nextIndex]
        }
    }
    
    //Returns the number of items to be reflected in the page indicator.
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        
        return vcArr?.count ?? 0
        
    }
    
}
