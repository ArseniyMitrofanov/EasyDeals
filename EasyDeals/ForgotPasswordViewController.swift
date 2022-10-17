//
//  ForgotPasswordPageViewController.swift
//  EasyDeals
//
//  Created by Арсений on 10.10.22.
//

import UIKit

class ForgotPasswordViewController: UIViewController, UITextFieldDelegate {

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
    let tempInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "//Здесь мы напишем что выслали код подтверждения на почту/телефон с указанием этой почты/телефона (siuuuuuuuuuuuuuuuuuuuuu)"
        label.textColor = .black
        label.numberOfLines = 3
        return label
    }()
    let txtFieldPhoneNumber: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Код из сообщения:"
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
        button.isUserInteractionEnabled = true
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        makeConstraints()
        txtFieldPassword.delegate = self
        txtFieldPhoneNumber.delegate = self
        txtFieldRepeatPassword.delegate = self
    }
    func addSubviews(){
        self.view.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(userImage)
        verticalStackView.addArrangedSubview(tempInfoLabel)
        verticalStackView.addArrangedSubview(txtFieldPhoneNumber)
        verticalStackView.addArrangedSubview(txtFieldPassword)
        verticalStackView.addArrangedSubview(txtFieldRepeatPassword)
        verticalStackView.addArrangedSubview(buttonShowHomePageVC)
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
            let vc = HomePageViewController()
            let navVC = UINavigationController(rootViewController: vc)
            navVC.modalPresentationStyle = .fullScreen
            present(navVC, animated: true)
        }
    }
}
