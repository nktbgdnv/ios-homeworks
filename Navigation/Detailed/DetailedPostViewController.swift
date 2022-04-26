//
//  DetailedPostViewController.swift
//  Navigation
//
//  Created by Никита Богданов on 27.04.2022.
//

import UIKit

class DetailedPostViewController: UIViewController {
                
    var selectedDataAuthor, selectedDataDescription, selectedDataImage: String?
    var selectedId: Int?
    var selectedDataLikes, selectedDataViews: Int?
    
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
    
    private lazy var stackViewPost: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.toAutoLayout()
        return stackView
    }()
    
    private lazy var stackViewLikesViews: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 120
        stackView.backgroundColor = .white
        stackView.isUserInteractionEnabled = true
        stackView.toAutoLayout()
        return stackView
    }()
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = NSTextAlignment.left
        if let text = selectedDataAuthor {
            label.text = text
        }
        label.toAutoLayout()
        return label
    }()
    
    private lazy var imageImageView: UIImageView = {
        let imageView = UIImageView()
        if let image = selectedDataImage {
            imageView.image = UIImage(named: image)
        }
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.toAutoLayout()
        return imageView
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.backgroundColor = .white
        if let text = selectedDataDescription {
            label.text = text
        }
        label.font = UIFont(name: "System", size: 14)
        label.textColor = .systemGray
        label.toAutoLayout()
        return label
    }()

    lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        if let likes = selectedDataLikes {
            label.text = "♡ " + String(likes)
        }
        label.font = UIFont(name: "System", size: 14)
        label.textColor = .black
        label.isUserInteractionEnabled = true
        label.toAutoLayout()
        return label
    }()
    
    private lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        if let views = selectedDataViews {
            label.text = "Просмотров: " + String(views)
        }
        label.font = UIFont(name: "System", size: 14)
        label.textAlignment = .right
        label.textColor = .black
        label.toAutoLayout()
        return label
    }()
    
    private let tapGestureRecognizer = UITapGestureRecognizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
        setupGesture()
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationItem.title = "Запись"
    }
    
    private func setupView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackViewPost)
        
        scrollView.addSubview(stackViewLikesViews)
        
        stackViewPost.addArrangedSubview(authorLabel)
        stackViewPost.addArrangedSubview(imageImageView)
        stackViewPost.addArrangedSubview(descriptionLabel)

        stackViewLikesViews.addArrangedSubview(likesLabel)
        stackViewLikesViews.addArrangedSubview(viewsLabel)

        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -36),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
       
            stackViewPost.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackViewPost.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackViewPost.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6),
            stackViewPost.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -6),
            
            stackViewLikesViews.topAnchor.constraint(equalTo: stackViewPost.bottomAnchor, constant: 6),
            stackViewLikesViews.leadingAnchor.constraint(equalTo: stackViewPost.leadingAnchor),
            stackViewLikesViews.trailingAnchor.constraint(equalTo: stackViewPost.trailingAnchor)
        ])
    }
    
    private func setupGesture() {
        self.tapGestureRecognizer.addTarget(self, action: #selector(self.tapLiked(_ :)))
        self.likesLabel.addGestureRecognizer(self.tapGestureRecognizer)
    }
    
    @objc func tapLiked(_ gestureRecognizer: UITapGestureRecognizer) {
        guard self.tapGestureRecognizer === gestureRecognizer else { return }
       
        for i in 0...dataSource.count - 1 {
            if dataSource[i].id == selectedId {
                dataSource[i].likes += 1
                likesLabel.text = "♥ " + String(dataSource[i].likes)
                likesLabel.layoutIfNeeded()
            }
        }
    }
}
