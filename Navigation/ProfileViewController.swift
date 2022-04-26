//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Никита Богданов on 27.02.2022.
//

import UIKit

final class ProfileViewController: UIViewController, TapLikedDelegate {
    
    private let profileHeaderView = ProfileHeaderView()
    private let detailedAvatarView: DetailedAvatarView = {
        let avatarView = DetailedAvatarView()
        avatarView.toAutoLayout()
        return avatarView
    }()
    
    var liked: Bool = false
    
    // create a tableView
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: String(describing: ProfileHeaderView.self))
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "ArticleCell")
        tableView.backgroundColor = .systemGray6
        tableView.layer.borderColor = UIColor.lightGray.cgColor
        tableView.layer.borderWidth = 0.5
        tableView.toAutoLayout()
        return tableView
    }()
    
    private var heightConstraint: NSLayoutConstraint?
    
    private let tapGestureRecognizer = UITapGestureRecognizer()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupView()
        addDataSource()
        self.setupGesture()
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.backButtonTitle = "Назад"
        self.navigationItem.title = "Профиль"
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(self.tableView)
        view.addSubview(detailedAvatarView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            detailedAvatarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailedAvatarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailedAvatarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailedAvatarView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            detailedAvatarView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // the function implements clicking on the user's avatar
    private func setupGesture() {
        tapGestureRecognizer.addTarget(self, action: #selector(handleTapGesture(_ :)))
        profileHeaderView.avatarImageView.addGestureRecognizer(tapGestureRecognizer)
    }
        
    @objc func handleTapGesture(_ gestureRecognizer: UITapGestureRecognizer){
        guard self.tapGestureRecognizer === gestureRecognizer else { return }
        UIView.animate(withDuration: 0.5) {
            self.detailedAvatarView.alpha = 1
        }
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    // method returns the number of rows in the table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count + 1
    }
    
    // the method sets the cells in the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath)
            cell.selectionStyle = .none
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? PostTableViewCell else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
                return cell
            }
            
            let article = dataSource[indexPath.row - 1]
            let viewModel = PostTableViewCell.ViewModel(author: article.author, image: article.image, description: article.description, heartSymbol: article.heartSymbol, likes: article.likes, views: article.views)
            cell.setup(with: viewModel)
            
            cell.likedDelegate = self
            if !liked {
                dataSource[indexPath.row - 1].heartSymbol = "♥"
                dataSource[indexPath.row - 1].likes += 1
                liked.toggle()
            }
            return cell
            }
    }
    
    // the method returns the view in the header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return profileHeaderView
    }
    
    // method returns cell height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return  250
    }
    
    // the method implements clicking on a cell with photos
    func tableView( _ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if indexPath.row == 0 {
            self.navigationController?.pushViewController(PhotosViewController(), animated: true)
            } else { return }
        }
    
    // the method changes the "liked" flag and updates the data in the table
    func tapLikedLabel() {
        liked.toggle()
        self.tableView.reloadData()
    }
    
}
