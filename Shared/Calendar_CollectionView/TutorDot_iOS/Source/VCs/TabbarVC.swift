//
//  TabbarVC.swift
//  TutorDot_iOS
//
//  Created by Sehwa Ryu on 29/06/2020.
//  Copyright © 2020 Sehwa Ryu. All rights reserved.
//

import UIKit

class TabbarVC: UITabBarController {

    static let identifier:String = "TabbarVC"
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = UIColor.clear
        tabBarSetUp()
        //self.tabBar.frame.size.height = 100
        //sizeThatFits(CGSize(width:300,height: 80))
        //viewWillLayoutSubviews()
        print (self.view.frame.size.height)
        //812
        //667
    }
    
    override func viewDidLayoutSubviews() {
        var tabFrame = self.tabBar.frame
        // - 40 is editable , the default value is 49 px, below lowers the tabbar and above increases the tab bar size
        if self.view.frame.size.height > 800 {
            tabFrame.size.height = 80
            tabFrame.origin.y = self.view.frame.size.height - 80
            self.tabBar.frame = tabFrame
        } else {
            tabFrame.size.height = 68
            tabFrame.origin.y = self.view.frame.size.height - 68
            self.tabBar.frame = tabFrame
        }
       
        

    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        let proportion = view.frame.height / 11
//        tabBar.frame.size.height = proportion
//        tabBar.frame.origin.y = view.frame.height - proportion
//
//
//    }
    
//    override func viewWillLayoutSubviews() {
//        var tabFrame = self.tabBar.frame
//        tabFrame.size.height = 100
//        tabFrame.origin.y = self.view.frame.size.height - 100
//        self.tabBar.frame = tabFrame
//    }
    
    
    
    
    func tabBarSetUp(){
    
        // Calendar Tab
        let calendarStoryboard = UIStoryboard.init(name: "Calendar", bundle: nil)
        guard let firstTab = calendarStoryboard.instantiateViewController(identifier: "CalendarVC")
            as? CalendarVC  else {
            return
        }
        
        if self.view.frame.size.height > 800 {
            firstTab.tabBarItem.image = UIImage(named: "tabbarIcCalenderUnpick")?.withRenderingMode(.alwaysOriginal)
            firstTab.tabBarItem.selectedImage = UIImage(named: "tabbarIcCalenderPick")?.withRenderingMode(.alwaysOriginal)
            
            print(#function)
        } else {
            firstTab.tabBarItem.image = UIImage(named: "classLogMathIcCalenderPick")?.withRenderingMode(.alwaysOriginal)
            firstTab.tabBarItem.selectedImage = UIImage(named: "calenderMathSectionIcCalenderPick")?.withRenderingMode(.alwaysOriginal)
        }
        
        

        let tabs =  [firstTab]

        self.setViewControllers(tabs, animated: false)
        self.selectedViewController = firstTab


    }
}

extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}



