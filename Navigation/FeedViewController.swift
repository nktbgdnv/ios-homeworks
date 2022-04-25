//
//  FeedViewController.swift
//  Navigation
//
//  Created by Никита Богданов on 12.03.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    var firstPost = Posts(author: "", description: "Первый пост", image: "", likes: 0, views: 0)
    var secondPost = Posts(author: "", description: "Второй пост", image: "", likes: 0, views: 0)

    @objc private func firstPostbuttonAction() {
        let postViewController = PostViewController()
        postViewController.titlePost = firstPost.description
        self.navigationController?.pushViewController(postViewController, animated: true)
       }
    
    @objc private func secondPostbuttonAction() {
        let postViewController = PostViewController()
        postViewController.titlePost = secondPost.description
        self.navigationController?.pushViewController(postViewController, animated: true)
       }
    
    // create button to go to the first post
    private lazy var firstPostButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 14
        button.setTitle(firstPost.description, for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(firstPostbuttonAction), for: .touchUpInside)
        button.toAutoLayout()
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 300).isActive = true
        return button
    }()
    
    // create button to go to the first post
    private lazy var secondPostButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 14
        button.setTitle(secondPost.description, for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(secondPostbuttonAction), for: .touchUpInside)
        button.toAutoLayout()
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.widthAnchor.constraint(equalToConstant: 300).isActive = true
        return button
    }()
    
    // create constraints for first button
    private func drawSelf() {
        
        
        /// create stackView
        let postsStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis  = NSLayoutConstraint.Axis.vertical
            stackView.distribution  = UIStackView.Distribution.equalSpacing
            stackView.alignment = UIStackView.Alignment.center
            stackView.spacing = 10
            stackView.addArrangedSubview(firstPostButton)
            stackView.addArrangedSubview(secondPostButton)
            stackView.toAutoLayout()
            return stackView
        }()
        
        self.view.addSubview(postsStackView)
        
        //Constraints for postsStackView
            postsStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            postsStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawSelf()
    }


}

