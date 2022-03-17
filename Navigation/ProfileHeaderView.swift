//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Никита Богданов on 17.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {

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
        
        // creating UIImageView with avatar
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
        
        // creating UILabel with name
        let nameLabel = UILabel()
        
        
    }
}
