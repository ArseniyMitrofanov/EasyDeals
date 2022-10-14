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
        navigationItemSetUp()
        
    }
    func navigationItemSetUp() {
        title = "Главная"
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "list.dash"),
            style: .done,
            target: self,
            action: #selector(didTapMenuButton))
    }
    @objc func didTapMenuButton() {
        let menuVC = MenuViewController()
        menu = SideMenuNavigationController(rootViewController: menuVC)
        menuVC.delegate = self
        menu?.leftSide = true
        menu?.setNavigationBarHidden(true, animated: true)
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        if let menu = menu {
            present(menu, animated: true)
        }
    }
}
extension HomePageViewController: MenuViewControllerDelegate {
    func didSelect(menuItem: MenuViewController.MenuOptions) {
        switch menuItem {
        case .profile:
            showUserProfileVC()
            break
        case .info:
            break
        case .appRating:
            break
        case .shareApp:
            break
        case .setting:
            break
        case .exit:
            self.exit()
        }
    }
    func exit() {
        self.dismiss(animated: true)
        dismiss(animated: true)
    }
    func showUserProfileVC() {
        self.dismiss(animated: true)
        let vc = UserProfileViewController()
        vc.view.backgroundColor = .systemBackground
        let backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtonItem
        navigationController?.pushViewController(vc, animated: false)
    }
}
