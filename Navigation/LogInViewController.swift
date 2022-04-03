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
    
    // UIImageView with logo
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo.jpg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // create UITextField (Login)
    let loginTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.placeholder = "Email of phone"
        textField.autocapitalizationType = .none
        textField.backgroundColor = .systemGray6
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        // textField.addTarget(self, action: #selector(statusTextFieldValueChanged), for: .editingChanged)
        return textField
    }()
    
    // create UITextField (Password)
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.backgroundColor = .systemGray6
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        // textField.addTarget(self, action: #selector(statusTextFieldValueChanged), for: .editingChanged)
        return textField
    }()
    
    private lazy var loginStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.clipsToBounds = true
        stackView.layer.cornerRadius = 10
        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.spacing = 0
        stackView.tintColor = .blue
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // Log In button
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 0.5
        button.clipsToBounds = true
        button.setTitle("Log In", for: .normal)
        button.tintColor = .white
        button.setBackgroundImage(UIImage(named: "blue_pixel.png"), for: .normal)
        // button.addTarget(self, action: #selector(firstPostbuttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        configureSubviews()
        setupConstraints()
        
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(self.tap(gesture:)))
        self.view.addGestureRecognizer(tapGesture)
        
    }

    @objc private func tap(gesture: UITapGestureRecognizer) {
            self.loginTextField.resignFirstResponder()
            self.passwordTextField.resignFirstResponder()
        }
    
    private func configureSubviews() {
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)
        self.contentView.addSubview(self.loginStackView)
        self.contentView.addSubview(self.logoImageView)
        self.contentView.addSubview(self.loginStackView)
        self.loginStackView.addArrangedSubview(self.loginTextField)
        self.loginStackView.addArrangedSubview(self.passwordTextField)
        self.contentView.addSubview(self.loginButton)
    }
    
    private func setupConstraints() {
        // constraints for scrollView
        let scrollViewTopConstraint = self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let scrollViewLeftConstraint = self.scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        let scrollViewRightConstraint = self.scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        let scrollViewBottomConstraint = self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)


        
        // constraints for contentView
        let contentViewTopConstraint = self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor)
        let contentViewBottomConstraint = self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor)
        let contentViewLeadingConstraint = self.contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor)
        let contentViewTrailingConstraint = self.contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor)
        let contentViewCenterXConstraint = self.contentView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor)
        let contentViewCenterYConstraint = self.contentView.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor)
        let contentViewWidthConstraint = self.contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor)

        
//        let heightConstraint = self.contentView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor)
//        heightConstraint.priority = UILayoutPriority(rawValue: 250)
//        heightConstraint.isActive = true
                
        // constraints for logo_picture
        let logoImageViewTopConstraint = self.logoImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 120)
        let logoImageViewBottomConstraint = self.logoImageView.bottomAnchor.constraint(equalTo: self.loginStackView.topAnchor, constant: -120)
        let logoImageViewCenterXConstraint = self.logoImageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        let logoImageViewWidthConstraint = self.logoImageView.widthAnchor.constraint(equalToConstant: 100)
        let logoImageViewHeightConstraint = self.logoImageView.heightAnchor.constraint(equalToConstant: 100)

        
        // constraints for login stackView
        let loginStackViewTopConstraint = self.loginStackView.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 120)
        let loginStackViewLeftConstraint = self.loginStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16)
        let loginStackViewRightConstraint = self.loginStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16)
        let loginStackViewHeightConstraint = self.loginStackView.heightAnchor.constraint(equalToConstant: 100)

        
        // constraints for loginButton
        let loginButtonTopConstraint = self.loginButton.topAnchor.constraint(equalTo: self.loginStackView.bottomAnchor, constant: 16)
        let loginButtonLeftConstraint = self.loginButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16)
        let loginButtonRightConstraint = self.loginButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16)
        let loginButtonHeightConstraint = self.loginButton.heightAnchor.constraint(equalToConstant: 50)
        
        NSLayoutConstraint.activate([
            scrollViewTopConstraint,
            scrollViewLeftConstraint,
            scrollViewRightConstraint,
            scrollViewBottomConstraint,
            contentViewTopConstraint,
            contentViewBottomConstraint,
            contentViewLeadingConstraint,
            contentViewTrailingConstraint,
            contentViewCenterXConstraint,
            contentViewCenterYConstraint,
            contentViewWidthConstraint,
            logoImageViewTopConstraint,
            logoImageViewBottomConstraint,
            logoImageViewCenterXConstraint,
            logoImageViewWidthConstraint,
            logoImageViewHeightConstraint,
            loginStackViewTopConstraint,
            loginStackViewLeftConstraint,
            loginStackViewRightConstraint,
            loginStackViewHeightConstraint,
            loginButtonTopConstraint,
            loginButtonLeftConstraint,
            loginButtonRightConstraint,
            loginButtonHeightConstraint
        ])
    }
}
