//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Никита Богданов on 17.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    var constraintFlag = false
    let initialStatus = "Waiting for something..."
    var statusText = "At home"
    
    private lazy var avatarImage = UIImage(named: "tom.jpeg")
    // private var fullNameLabel = UILabel(frame: .zero)
    private var statusLabel = UILabel()
    private lazy var statusTextField = UITextField(frame: .zero)
    // private var setStatusButton = UIButton(frame: .zero)
    
    private var initialStatusButtonConstraints = [NSLayoutConstraint]()
    private var newStatusButtonConstraints = [NSLayoutConstraint]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // creating subviews
    func createSubViews() {
        backgroundColor = .lightGray
        
        /// creating UIImageView with avatar
        let avatarImageView: UIImageView = {
            let imageView = UIImageView(image: avatarImage!)
            imageView.contentMode = UIView.ContentMode.scaleAspectFill
            imageView.image = avatarImage
            // Make image corners Rounded
            imageView.layer.cornerRadius = 60
            imageView.clipsToBounds = true
            imageView.layer.borderWidth = 3
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        self.addSubview(avatarImageView)
        
        /// creating label with name
        let fullNameLabel: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.text = "Tom Cruise"
            label.textColor = .black
            label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        self.addSubview(fullNameLabel)
        
        /// creating label with status
        statusLabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.text = statusText
            label.textColor = .gray
            label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        self.addSubview(statusLabel)
        
        /// create text field
        statusTextField = {
            let textField = UITextField()
            textField.textColor = .black
            textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            textField.backgroundColor = .white
            textField.layer.cornerRadius = 12
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor.black.cgColor
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.addTarget(self, action: #selector(statusTextFieldValueChanged), for: .editingChanged)
            return textField
        }()
        self.addSubview(statusTextField)
        
        /// set settings for statusButton
        let setStatusButton: UIButton = {
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
            button.translatesAutoresizingMaskIntoConstraints = false
        return button
        }()
        self.addSubview(setStatusButton)
    
        /// CONSTRAINTS
        // constraints for avatarView
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ])
        
        // constraints for label with fullname
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 150)
        ])
        
        // constraints for label with status
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 90),
            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor)
        ])

        // set constraints for text field
        NSLayoutConstraint.activate([statusTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 115),
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
        

    }
    
}
