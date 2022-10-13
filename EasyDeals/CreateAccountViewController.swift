//
//  CreateAccountViewController.swift
//  EasyDeals
//
//  Created by Вадим Сайко on 11.10.22.
//

import UIKit
import KeychainSwift

class CreateAccountViewController: UIViewController, UITextFieldDelegate {
    
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
    let txtFieldRepeatPassword: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Подтвердите пароль:"
        textField.isSecureTextEntry = true
        return textField
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        makeConstraints()
        txtFieldPhoneNumber.delegate = self
        txtFieldPassword.delegate = self
        txtFieldRepeatPassword.delegate = self
    }
    
    func addSubviews() {
        verticalStackView.addArrangedSubview(userImage)
        verticalStackView.addArrangedSubview(txtFieldPhoneNumber)
        verticalStackView.addArrangedSubview(txtFieldPassword)
        verticalStackView.addArrangedSubview(txtFieldRepeatPassword)
        verticalStackView.addArrangedSubview(buttonShowHomePageVC)
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
            txtFieldRepeatPassword.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor),
            buttonShowHomePageVC.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor),
        ])
    }
    @objc func showHomePageVC(_ button: UIButton) {
        if button == button {
            let loginInfo = LoginInformation(phoneNumber: txtFieldPhoneNumber.text ?? "", password: txtFieldPassword.text ?? "")
            if keyChain.get(loginInfo.phoneNumber) != nil {
                print("This phone number is already in use")
            } else {
                keyChain.set(loginInfo.password, forKey: loginInfo.phoneNumber)
            }
            let vc = HomePageViewController()
            let navVC = UINavigationController(rootViewController: vc)
            navVC.modalPresentationStyle = .fullScreen
            present(navVC, animated: true)
        }
    }
    func validateFields() -> String? {
        let cleanedPassword = txtFieldPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if (txtFieldPhoneNumber.text?.trimmingCharacters(in: .whitespacesAndNewlines).count ?? 0) < 2 ||
            (txtFieldPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines).count ?? 0) < 2 {
            return "Length of your phone number or password is not enough"
        }
        
        if isPasswordValid(cleanedPassword) == false {
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        if txtFieldPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) !=
            txtFieldRepeatPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) {
            return "Your passwords are different"
        }
        return nil
    }
    
    func isPasswordValid(_ password : String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if validateFields() == nil {
            buttonShowHomePageVC.isUserInteractionEnabled = true
        }
    }
}

struct LoginInformation: Codable {
    var phoneNumber: String
    var password: String
}
