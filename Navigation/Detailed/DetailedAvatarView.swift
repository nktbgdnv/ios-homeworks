//
//  DetailedAvatarView.swift
//  Navigation
//
//  Created by Никита Богданов on 25.04.2022.
//

import UIKit

class DetailedAvatarView: UIView {
    
    private lazy var alphaView: UIView = {
        let view = UIView()
        view.alpha = 0.7
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "nik"))
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
        button.addTarget(self, action: #selector(self.didTapCloseButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let screenWidth = UIScreen.main.bounds.width
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        self.alpha = 0
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        self.addSubview(alphaView)
        self.addSubview(closeButton)
        self.addSubview(avatarImageView)
                    
        NSLayoutConstraint.activate([
            alphaView.topAnchor.constraint(equalTo: self.topAnchor),
            alphaView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            alphaView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            alphaView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            avatarImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            avatarImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: screenWidth),
            avatarImageView.widthAnchor.constraint(equalToConstant: screenWidth),
            closeButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            closeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc private func didTapCloseButton() {
        UIView.animate(withDuration: 0.5) {
            self.alpha = 0
        }
    }
}
