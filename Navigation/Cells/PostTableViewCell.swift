//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Никита Богданов on 13.04.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    // create data pattern
    struct ViewModel {
        let author: String
        let image: String
        let description: String
        var likes: Int
        var views: Int
    }
    
    // create view, that will be added to ContentView
    private lazy var backView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.maskedCorners = [
            .layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner
        ]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // create stackView for post
    private lazy var stackViewPost: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // create stackView for labels of Likes & Views
    private lazy var stackViewLikesViews: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // create label for author's name
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.textAlignment = NSTextAlignment.left
        label.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // create imageView for the picture of post
    private lazy var imageImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.setContentCompressionResistancePriority(UILayoutPriority(100), for: .vertical)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // create label for post's description
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.justified
        label.font = UIFont(name: "System", size: 14)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // create label for number of likes
    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont(name: "System", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // create label for number of views
    private lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = UIFont(name: "System", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.authorLabel.text = nil
        self.imageImageView.image = nil
        self.descriptionLabel.text = nil
        self.likesLabel.text = nil
        self.viewsLabel.text = nil
    }
    
    private func setupView() {
        contentView.backgroundColor = .white
        contentView.addSubview(backView)
        backView.addSubview(stackViewPost)
        stackViewPost.addArrangedSubview(authorLabel)
        stackViewPost.addArrangedSubview(imageImageView)
        stackViewPost.addArrangedSubview(descriptionLabel)
        stackViewPost.addArrangedSubview(stackViewLikesViews)
        stackViewLikesViews.addArrangedSubview(likesLabel)
        stackViewLikesViews.addArrangedSubview(viewsLabel)
        stackViewPost.backgroundColor = .white
        backViewConstraints()
        stackViewPostConstraints()
    }
    
    private func backViewConstraints() {
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func stackViewPostConstraints() {
        NSLayoutConstraint.activate([
            stackViewPost.topAnchor.constraint(equalTo: backView.topAnchor),
            stackViewPost.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 16),
            stackViewPost.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -16),
            stackViewPost.bottomAnchor.constraint(equalTo: backView.bottomAnchor)
        ])
    }
    
    func setup(with viewModel: ViewModel) {
        self.authorLabel.text = viewModel.author
        self.imageImageView.image = UIImage(named: viewModel.image)
        self.descriptionLabel.text = viewModel.description
        self.likesLabel.text = "Likes: " + String(viewModel.likes)
        self.viewsLabel.text = "Views: " + String(viewModel.views)
    }
}
