//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Никита Богданов on 17.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    let status = "I am drinking tea!"
    var statusLabel = UILabel()
    
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
        let avatarImage = UIImage(named: "tom.jpeg")
        let avatarImageView = UIImageView(image: avatarImage!)
        avatarImageView.contentMode = UIView.ContentMode.scaleAspectFill
        avatarImageView.image = avatarImage
        
        // Make image corners Rounded
        avatarImageView.layer.cornerRadius = 60
        avatarImageView.clipsToBounds = true
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(avatarImageView)
        
        /// creating label with name
        let fullNameLabel = UILabel(frame: .zero)
        fullNameLabel.numberOfLines = 0
        fullNameLabel.text = "Tom Cruise"
        fullNameLabel.textColor = .black
        fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(fullNameLabel)

        
        /// creating label with status
        statusLabel = UILabel(frame: .zero)
        statusLabel.numberOfLines = 0
        statusLabel.text = "Waiting for something..."
        statusLabel.textColor = .gray
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(statusLabel)

        
        /// create text field
        let statusTextField = UITextField(frame: .zero)
        statusTextField.textColor = .black
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.backgroundColor = .white
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(statusTextField)
        
        
        /// create status button
        let setStatusButton = UIButton(frame: .zero)
        setStatusButton.backgroundColor = .blue
        setStatusButton.setTitle("Set status", for: .normal)
        setStatusButton.addTarget(self, action: #selector(buttonStatusAction), for: .touchUpInside)
        
        // Shadow and Radius for status Button
        setStatusButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 3).cgColor
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.layer.shadowRadius = 4.0
        setStatusButton.layer.masksToBounds = false
        setStatusButton.layer.cornerRadius = 4.0
        
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(setStatusButton)
        
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
        
        
        // constraints for text field
        NSLayoutConstraint.activate([
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 15),
            statusTextField.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: setStatusButton.trailingAnchor),
            NSLayoutConstraint(item: statusTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)
        ])
        
        // constraints for status button
        NSLayoutConstraint.activate([
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 20),
            setStatusButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            NSLayoutConstraint(item: setStatusButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40)
        ])

    }
    
    // function changing status
    @objc func buttonStatusAction() {
        statusLabel.text = status
        print("Current status: \(statusLabel.text!)")
    }
    
}
