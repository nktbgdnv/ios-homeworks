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
        scrollView.toAutoLayout()
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.toAutoLayout()
        return contentView
    }()
    
    // UIImageView with logo
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo.jpg")
        imageView.toAutoLayout()
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
        textField.toAutoLayout()
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
        textField.toAutoLayout()
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
        stackView.toAutoLayout()
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
        button.addTarget(self, action: #selector(loginButtonClick), for: .touchUpInside)
        button.toAutoLayout()
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        configureSubviews()
        setupConstraints()
        
        // hide the keyboard when you press the screen
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(self.tap(gesture:)))
        self.view.addGestureRecognizer(tapGesture)
    }

    // adding observers when view will appears
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // adding observers when view did disappears
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        let nc = NotificationCenter.default
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // method to raise the bottom of the ScrollView when the keyboard is extended
    @objc private func keyboardShow(notification: NSNotification) {
        guard let keyboardFrameValue = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue) else { return }
        let keyboardFrame = self.view.convert(keyboardFrameValue.cgRectValue, from: nil)
        if UIDevice.current.orientation.isLandscape {
            scrollView.contentInset.bottom = keyboardFrame.size.height + 60
            scrollView.scrollIndicatorInsets = scrollView.contentInset
        } else {
            scrollView.contentInset.bottom = keyboardFrame.size.height + 60
            scrollView.scrollIndicatorInsets = scrollView.contentInset
            }
        }
    
    @objc private func keyboardHide(notification: NSNotification) {
        scrollView.contentInset = .zero
        scrollView.scrollIndicatorInsets = scrollView.contentInset
    }
    
    @objc private func tap(gesture: UITapGestureRecognizer) {
            self.loginTextField.resignFirstResponder()
            self.passwordTextField.resignFirstResponder()
        }
    
    @objc private func loginButtonClick() {
        // passing to ProfileViewController instance
        let profileViewController = ProfileViewController()
        self.navigationController?.pushViewController(profileViewController, animated: true)
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
        NSLayoutConstraint.activate([
            // constraints for scrollView
            self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            // constraints for contentView
            self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            self.contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor),
            // constraints for logo_picture
            self.logoImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 120),
            self.logoImageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.logoImageView.heightAnchor.constraint(equalToConstant: 100),
            self.logoImageView.heightAnchor.constraint(equalTo: self.logoImageView.widthAnchor, multiplier: 1.0),
            // constraints for login stackView
            self.loginStackView.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 120),
            self.loginStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.loginStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.loginStackView.heightAnchor.constraint(equalToConstant: 100),
            // constraints for loginButton
            self.loginButton.topAnchor.constraint(equalTo: self.loginStackView.bottomAnchor, constant: 30),
            self.loginButton.leadingAnchor.constraint(equalTo: self.loginStackView.leadingAnchor),
            self.loginButton.trailingAnchor.constraint(equalTo: self.loginStackView.trailingAnchor),
            self.loginButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

public extension UIView {
    func toAutoLayout() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
