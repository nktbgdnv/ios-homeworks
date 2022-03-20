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
        let avatarImage = UIImage(named: "tom.png")
        let avatarView = UIImageView(image: avatarImage!)
        avatarView.contentMode = UIView.ContentMode.scaleAspectFill
        avatarView.frame.size.width = 150
        avatarView.frame.size.height = 150
        avatarView.image = avatarImage
        
        // Make image corners Rounded
        avatarView.layer.cornerRadius = 75
        avatarView.clipsToBounds = true
        avatarView.layer.borderWidth = 3
        avatarView.layer.borderColor = UIColor.white.cgColor
        
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(avatarView)
        
        // constraints for avatarView
        NSLayoutConstraint.activate([
            avatarView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        ])
        
        /// creating UILabel with name
        let nameLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 50, height: 10))
        nameLabel.numberOfLines = 0
        nameLabel.text = "Tom Cruise"
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameLabel)
        
        // constraints for label with name
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            nameLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 175)
        ])
        
        /// creating UILabel with status
        statusLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 50, height: 10))
        statusLabel.numberOfLines = 0
        statusLabel.text = "Waiting for something..."
        statusLabel.textColor = .gray
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(statusLabel)
        
        // constraints for label with name
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 120),
            statusLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 175)
        ])
        
        /// create status button
        let statusButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 15))
        statusButton.backgroundColor = .blue
        statusButton.setTitle("Set status", for: .normal)
        statusButton.addTarget(self, action: #selector(buttonStatusAction), for: .touchUpInside)
        
        // Shadow and Radius for status Button
        statusButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 3).cgColor
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowOpacity = 0.7
        statusButton.layer.shadowRadius = 4.0
        statusButton.layer.masksToBounds = false
        statusButton.layer.cornerRadius = 4.0
        
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(statusButton)
        
        // constraints for status button
        NSLayoutConstraint.activate([
            statusButton.topAnchor.constraint(equalTo: avatarView.safeAreaLayoutGuide.bottomAnchor, constant: 16),
            statusButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])

    }
    
    // function changing status
    @objc func buttonStatusAction() {
        statusLabel.text = status
        print("Current status: \(statusLabel.text!)")
    }
    
}
