//
//  AuthorizationPage.swift
//  EasyDeals
//
//  Created by Арсений on 28.08.22.
//

import UIKit
import KeychainSwift

class AuthorizationPageViewController: UIViewController, UITextFieldDelegate {
    
    let keyChain = KeychainSwift()

    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 15
        return stackView
    }()
    let userImage: UIImageView = {
        let imageView  = UIImageView(image: UIImage(named: "userImage"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let txtFieldPhoneNumber: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Номер телефона:"
        return textField
    }()
    let txtFieldPassword: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Пароль:"
        textField.isSecureTextEntry = true
        return textField
    }()
    lazy var buttonShowSignInPageVC: UIButton = {
        let button = UIButton()
        button.setTitle("Создать аккаунт", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(showCreateAccountVC), for: .touchUpInside)
        return button
    }()
    lazy var buttonShowHomePageVC: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(showHomePageVC), for: .touchUpInside)
        button.isUserInteractionEnabled = false
        return button
    }()
    lazy var buttonForgotPassword: UIButton = {
        let button = UIButton()
        button.setTitle("Забыли пароль?", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(showForgotPasswordVC), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        makeConstraints()
        txtFieldPhoneNumber.delegate = self
        txtFieldPassword.delegate = self
    }
    
    func addSubviews() {
        verticalStackView.addArrangedSubview(userImage)
        verticalStackView.addArrangedSubview(txtFieldPhoneNumber)
        verticalStackView.addArrangedSubview(txtFieldPassword)
        verticalStackView.addArrangedSubview(buttonShowHomePageVC)
        verticalStackView.addArrangedSubview(buttonForgotPassword)
        verticalStackView.addArrangedSubview(buttonShowSignInPageVC)
        self.view.addSubview(verticalStackView)
    }
    func makeConstraints() {
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userImage.widthAnchor.constraint(equalTo: userImage.heightAnchor),
            userImage.widthAnchor.constraint(equalToConstant: 150),
            txtFieldPhoneNumber.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor),
            txtFieldPassword.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor),
            buttonShowHomePageVC.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor),
            buttonForgotPassword.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor),
            buttonShowSignInPageVC.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor)
        ])
    }
    @objc func showHomePageVC(_ button: UIButton) {
        if button == button {
            let vc = HomePageViewController()
            let navVC = UINavigationController(rootViewController: vc)
            navVC.modalPresentationStyle = .fullScreen
            present(navVC, animated: true)
        }
    }
    @objc func showCreateAccountVC(_ button: UIButton) {
        if button == button {
            let vc = CreateAccountViewController()
            vc.view.backgroundColor = .systemBackground
            let backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
            navigationItem.backBarButtonItem = backBarButtonItem
            navigationController?.pushViewController(vc, animated: false)
        }
    }
    @objc func showForgotPasswordVC(_ button: UIButton) {
        if button == button {
            let vc = ForgotPasswordViewController()
            vc.view.backgroundColor = .systemBackground
            let backBarButtonItem = UIBarButtonItem(title: "Назад", style: .plain, target: nil, action: nil)
            navigationItem.backBarButtonItem = backBarButtonItem
            navigationController?.pushViewController(vc, animated: false)
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let keyChainPhoneNumber = keyChain.get("phoneNumber"),
              let keyChainPassword = keyChain.get("password") else {return}
        if txtFieldPhoneNumber.text == keyChainPhoneNumber && txtFieldPassword.text == keyChainPassword {
            buttonShowHomePageVC.isUserInteractionEnabled = true
        }
    }
}
