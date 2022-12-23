//
//  ViewController.swift
//  ToDoList
//
//  Created by Aybike Zeynep Tiryaki on 19.12.2022.
//

import UIKit

class MainTabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UINavigationController(rootViewController: HomeScreenVC())
        let vc2 = UINavigationController(rootViewController: SortScreenVC())
        
        vc1.tabBarItem.image = UIImage(systemName: "house.fill")
        vc2.tabBarItem.image = UIImage(systemName: "doc.plaintext")
        
        vc1.title = "Todo's ✅"
        vc2.title = "Sort"
        setViewControllers([vc1, vc2], animated: true)
    }
}

