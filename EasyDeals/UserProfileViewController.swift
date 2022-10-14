//
//  UserProfileViewController.swift
//  EasyDeals
//
//  Created by Арсений on 12.10.22.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()
    let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 25
        return stackView
    }()
    let userImage: UIImageView = {
        let imageView  = UIImageView(image: UIImage(named: "Jony"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let verticalStackSubview: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 5
        return stackView
    }()
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Арсений"
        label.numberOfLines = 2
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 25)
        return label
    }()
    let userSurnameLabel: UILabel = {
        let label = UILabel()
        label.text = "Митрофанов"
        label.numberOfLines = 2
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 25)
        return label
    }()
    
    let userBirthdayLabel: UILabel = {
        let label = UILabel()
        label.text = "05.04.2004"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    let userPhoneNumber: UILabel = {
        let label = UILabel()
        label.text = "+375291697223"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        makeConstraints()
    }
    func addSubviews() {
        self.view.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(userImage)
        horizontalStackView.addArrangedSubview(verticalStackSubview)
        verticalStackSubview.addArrangedSubview(userNameLabel)
        verticalStackSubview.addArrangedSubview(userSurnameLabel)
        verticalStackSubview.addArrangedSubview(userBirthdayLabel)
        verticalStackSubview.addArrangedSubview(userPhoneNumber)
    }
    func makeConstraints() {
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 115),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            horizontalStackView.heightAnchor.constraint(equalTo: userImage.heightAnchor),
//            verticalStackSubview.heightAnchor.constraint(equalTo: userImage.heightAnchor),
            userImage.widthAnchor.constraint(equalTo: userImage.heightAnchor),
            userImage.widthAnchor.constraint(equalToConstant: 160)
        ])
    }

}
