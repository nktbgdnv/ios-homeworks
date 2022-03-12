//
//  FeedViewController.swift
//  Navigation
//
//  Created by Никита Богданов on 12.03.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    var firstPost = Post(title: "Первый пост")

    @objc private func buttonAction() {
        let postViewController = PostViewController()
        postViewController.titlePost = firstPost.title
        self.navigationController?.pushViewController(postViewController, animated: true)
       }
    
    // create button to go to the first post
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 12
        button.setTitle(firstPost.title, for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // create visual content for button
    private func setupButton() {
            self.view.addSubview(self.button)
            self.button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
            self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
            self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
            self.button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
    }


}
