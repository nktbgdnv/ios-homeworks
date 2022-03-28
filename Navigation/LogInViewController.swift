//
//  LogInViewController.swift
//  Navigation
//
//  Created by Никита Богданов on 27.03.2022.
//

import UIKit

class LogInViewController: UIViewController {

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    // Log In button
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 12
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        // button.addTarget(self, action: #selector(firstPostbuttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // UIImageView with logo
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        // imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.image = UIImage(named: "logo.jpg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // create UITextField (Login)
    let loginTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        // textField.addTarget(self, action: #selector(statusTextFieldValueChanged), for: .editingChanged)
        return textField
    }()
    
    // create UITextField (Password)
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        // textField.addTarget(self, action: #selector(statusTextFieldValueChanged), for: .editingChanged)
        return textField
    }()
    
    private lazy var loginStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        configureSubviews()
        setupConstraints()
    }

    private func configureSubviews() {
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)
        self.contentView.addSubview(self.loginButton)
        self.contentView.addSubview(self.logoImageView)
        self.contentView.addSubview(self.loginStackView)
        self.loginStackView.addArrangedSubview(loginTextField)
        self.loginStackView.addArrangedSubview(passwordTextField)
    }
    
    private func setupConstraints() {
        // constraints for scrollView
        let scrollViewTopConstraint = self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let scrollViewRightConstraint = self.scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        let scrollViewBottomConstraint = self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        let scrollViewLeftConstraint = self.scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        
        // constraints for contentView
        let contentViewTopConstraint = self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor)
        let contentViewCenterXConstraint = self.contentView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor)
        let contentViewBottomConstraint = self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor)
        let contentViewWidthConstraint = self.contentView.widthAnchor.constraint(equalToConstant: 200)
        
        // constraints for logo_picture
        let logoImageViewTopConstraint = self.logoImageView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 120)
        let logoImageViewCenterXConstraint = self.logoImageView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor)
        let logoImageViewWidthConstraint = self.logoImageView.widthAnchor.constraint(equalToConstant: 100)
        let logoImageViewHeightConstraint = self.logoImageView.heightAnchor.constraint(equalToConstant: 100)
        
        // constraints for login stackView
        let loginStackViewTopConstraint = self.loginStackView.topAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: 120)
        let loginStackViewCenterXConstraint = self.loginStackView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor)
        let loginStackViewLeftConstraint = self.loginStackView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 16)
        let loginStackViewRightConstraint = self.loginStackView.trailingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: -16)
        let loginStackViewHeightConstraint = self.loginStackView.heightAnchor.constraint(equalToConstant: 100)
        
        // constraints for LogIn Button
//        let loginButtonTopConstraint = self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor)
//        let loginButtonCenterXConstraint = self.contentView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor)
//        let loginButtonBottomConstraint = self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor)
//        let loginButtonWidthConstraint = self.contentView.widthAnchor.constraint(equalToConstant: 200)
        
        NSLayoutConstraint.activate([
            scrollViewTopConstraint, scrollViewRightConstraint, scrollViewBottomConstraint, scrollViewLeftConstraint,
            contentViewTopConstraint, contentViewCenterXConstraint, contentViewBottomConstraint, contentViewWidthConstraint,
            logoImageViewTopConstraint, logoImageViewCenterXConstraint,
            logoImageViewWidthConstraint, logoImageViewHeightConstraint,
            loginStackViewTopConstraint, loginStackViewCenterXConstraint, loginStackViewLeftConstraint,
            loginStackViewRightConstraint, loginStackViewHeightConstraint
        ])
    }
}
