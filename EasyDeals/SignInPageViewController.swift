//
//  SignInPageViewController.swift
//  EasyDeals
//
//  Created by Арсений on 10.10.22.
//

import UIKit

class SignInPageViewController: UIViewController {
    let verticalStackView = UIStackView()
    let userImage = UIImageView(image: UIImage(named: "userImage"))
    let txtFieldPhoneNumber = UITextField()
    let txtFieldPassword = UITextField()
    let txtFieldRepeatPassword = UITextField()
    let buttonShowHomePageVC = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(verticalStackView)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fill
        verticalStackView.alignment = .center
        verticalStackView.spacing = 15
        verticalStackView.addArrangedSubview(userImage)
        userImage.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.addArrangedSubview(txtFieldPhoneNumber)
        txtFieldPhoneNumber.borderStyle = .roundedRect
        txtFieldPhoneNumber.placeholder = "Номер телефона:"
        verticalStackView.addArrangedSubview(txtFieldPassword)
        txtFieldPassword.borderStyle = .roundedRect
        txtFieldPassword.placeholder = "Пароль:"
        txtFieldPassword.isSecureTextEntry = true
        verticalStackView.addArrangedSubview(txtFieldRepeatPassword)
        txtFieldRepeatPassword.borderStyle = .roundedRect
        txtFieldRepeatPassword.placeholder = "Подтвердите пароль:"
        txtFieldRepeatPassword.isSecureTextEntry = true
        verticalStackView.addArrangedSubview(buttonShowHomePageVC)
        buttonShowHomePageVC.backgroundColor = .black
        buttonShowHomePageVC.layer.cornerRadius = 10
        buttonShowHomePageVC.setTitle("Войти", for: .normal)
        buttonShowHomePageVC.setTitleColor(.white, for: .normal)

        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userImage.widthAnchor.constraint(equalTo: userImage.heightAnchor),
            userImage.widthAnchor.constraint(equalToConstant: 150),
            txtFieldPhoneNumber.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor),
            txtFieldPassword.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor),
            txtFieldRepeatPassword.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor),
            buttonShowHomePageVC.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor),
           
        ])
        buttonShowHomePageVC.addTarget(self, action: #selector(showHomePageVC), for: .touchUpInside)
    }
    @objc func showHomePageVC(_ button: UIButton) {
        if button == button {
            let vc = HomePageViewController()
            let navVC = UINavigationController(rootViewController: vc)
            navVC.modalPresentationStyle = .fullScreen
            present(navVC, animated: true)
        }
    }
    

}
