//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Никита Богданов on 17.03.2022.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    // UIImageView with avatar
    lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "nik"))
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        // Make image corners Rounded
        imageView.layer.cornerRadius = 60
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.toAutoLayout()
        return imageView
    }()
    
    // label with name
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Nikita Bogdanov"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.toAutoLayout()
        return label
    }()
    
    // label with status
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = statusText
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.toAutoLayout()
        return label
    }()
    
    // textField with status
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.toAutoLayout()
        textField.addTarget(self, action: #selector(statusTextFieldValueChanged), for: .editingChanged)
        return textField
    }()
    
    // statusButton
    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Set status", for: .normal)
        button.addTarget(self, action: #selector(buttonStatusAction), for: .touchUpInside)
    // Shadow and Radius for status Button
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 3).cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4.0
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 4.0
        button.toAutoLayout()
    return button
    }()
    
    var statusText = "At home"
        
    private var initialStatusButtonConstraints = [NSLayoutConstraint]()
    private var newStatusButtonConstraints = [NSLayoutConstraint]()
    
    static let reuseIdentifier: String = String(describing: self)
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        createSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createSubViews()
    }
    
    
    // creating subviews
    func createSubViews() {
        backgroundColor = .white

        self.addSubview(avatarImageView)
        self.addSubview(fullNameLabel)
        self.addSubview(statusLabel)
        self.addSubview(statusTextField)
        self.addSubview(setStatusButton)
    
        /// CONSTRAINTS
        NSLayoutConstraint.activate([
            // constraints for avatarView
            avatarImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            // constraints for label with fullname
            fullNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 150),
            // constraints for label with status
            statusLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 90),
            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            // set constraints for text field
            statusTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 115),
            statusTextField.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: setStatusButton.trailingAnchor),
            NSLayoutConstraint(item: statusTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        ])
        
        // Constraints for status button
        let topConstraintForButton = setStatusButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 180)
        let leadingConstraintForButton = setStatusButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        let trailingConstraintForButton = setStatusButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        let heightConstraintForButton = NSLayoutConstraint(item: setStatusButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        initialStatusButtonConstraints.append(contentsOf: [topConstraintForButton,
                                                       leadingConstraintForButton,
                                                       trailingConstraintForButton,
                                                       heightConstraintForButton])
        NSLayoutConstraint.activate(initialStatusButtonConstraints)

    }
    
    @objc func statusTextFieldValueChanged() {
        statusText = statusTextField.text!
    }
    
    // function changing status
    @objc func buttonStatusAction() {
        statusTextFieldValueChanged()
        statusLabel.text = statusText
        statusTextField.text = nil
        addTapGestureToHideKeyboard()
    }
    
    // method to hide the keyboard, when you click the on the screen
    func addTapGestureToHideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.endEditing))
        self.addGestureRecognizer(tapGesture)
    }
}
