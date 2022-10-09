//
//  HomePageViewController.swift
//  EasyDeals
//
//  Created by Вадим Сайко on 9.10.22.
//

import UIKit
import SideMenu

class HomePageViewController: UIViewController {
    
    var menu: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Главная"
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "list.dash"),
            style: .done,
            target: self,
            action: #selector(didTapMenuButton))
        
        menu = SideMenuNavigationController(rootViewController: MenuViewController())
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: true)
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
    }
    @objc func didTapMenuButton() {
        if let menu = menu {
            present(menu, animated: true)
        }
    }
}
