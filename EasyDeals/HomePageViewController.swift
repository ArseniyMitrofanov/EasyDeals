//
//  HomePageViewController.swift
//  EasyDeals
//
//  Created by Вадим Сайко on 9.10.22.
//

import UIKit
import SideMenu
import GoogleMaps
import CoreLocation
    
class HomePageViewController: UIViewController, CLLocationManagerDelegate {

    let mapView: GMSMapView = {
        let mapView = GMSMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    let locationManager: CLLocationManager = {
        var locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        return locationManager
    }()
    var menu: SideMenuNavigationController?

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        view.backgroundColor = .white
        view.addSubview(mapView)
        navigationItemSetUp()
        makeConstraints()
    }
    
    func navigationItemSetUp() {
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        title = "Главная"
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "list.dash"),
            style: .done,
            target: self,
            action: #selector(didTapMenuButton))
    }
    func makeConstraints() {
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {return}
        let coordinate = location.coordinate
        let camera = GMSCameraPosition.camera(withLatitude: coordinate.latitude, longitude: coordinate.longitude, zoom: 6.0)
        mapView.camera = camera
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
//        marker.title = "Sydney"
//        marker.snippet = "Australia"
        marker.map = mapView
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
        case .info:
            break
        case .appRating:
            break
        case .shareApp:
            break
        case .setting:
            break
        case .exit:
            exit()
        }
    }
    func exit() {
        self.dismiss(animated: true)
        dismiss(animated: true)
    }
    func showUserProfileVC() {
        self.dismiss(animated: true)
        let vc = UserProfileViewController()
        vc.view.backgroundColor = .white
        let backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtonItem
        navigationController?.pushViewController(vc, animated: false)
    }
}
    
    //MARK: - GoogleMapsLicense
    //обязательно включить это в раздел "Информация"
    //        print(GMSServices.openSourceLicenseInfo())
