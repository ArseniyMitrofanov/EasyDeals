//
//  SignInPage.swift
//  EasyDeals
//
//  Created by Арсений on 5.09.22.
//

import UIKit

class SignInPage: UIViewController {

    let verticalStackView = UIStackView()
    let userImage = UIImageView(image: UIImage(named: "userImage"))
    let txtFieldPhoneNumber = UITextField()
    let txtFieldPassword = UITextField()
    let buttonSignIn = UIButton()
    let buttonForgotPassword = UIButton()
    let buttonCreateAccount = UIButton()
    
    
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
//        txtFieldPhoneNumber.translatesAutoresizingMaskIntoConstraints = false
        txtFieldPhoneNumber.borderStyle = .roundedRect
        txtFieldPhoneNumber.placeholder = "Номер телефона:"
        verticalStackView.addArrangedSubview(txtFieldPassword)
        txtFieldPassword.borderStyle = .roundedRect
        txtFieldPassword.placeholder = "Пароль:"
        txtFieldPassword.isSecureTextEntry = true
        verticalStackView.addArrangedSubview(buttonSignIn)
        buttonSignIn.backgroundColor = .black
        buttonSignIn.layer.cornerRadius = 10
        buttonSignIn.setTitle("Войти", for: .normal)
        buttonSignIn.setTitleColor(.white, for: .normal)
        verticalStackView.addArrangedSubview(buttonForgotPassword)
        buttonForgotPassword.setTitle("Забыли пароль?", for: .normal)
        buttonForgotPassword.setTitleColor(.black, for: .normal)
        verticalStackView.addArrangedSubview(buttonCreateAccount)
        buttonCreateAccount.setTitle("Создать аккаунт", for: .normal)
        buttonCreateAccount.setTitleColor(.black, for: .normal)
        
        
     
        
        
        
        NSLayoutConstraint.activate([
            
            verticalStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userImage.widthAnchor.constraint(equalTo: userImage.heightAnchor),
            userImage.widthAnchor.constraint(equalToConstant: 150),
            txtFieldPhoneNumber.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor),
            txtFieldPassword.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor),
            buttonSignIn.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor),
            buttonForgotPassword.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor),
            buttonCreateAccount.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor)
            
        ])
    }
    
//    @objc func showSignInPage(){
//        if let vc =
//    }

}
