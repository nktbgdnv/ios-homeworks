//
//  DetailedPhotoViewController.swift
//  Navigation
//
//  Created by Никита Богданов on 27.04.2022.
//

import UIKit

class DetailedPhotoViewController: UIViewController {
    
    var selectedImage: String?
    
    private lazy var transparentView: UIView = {
        let view = UIView()
        view.alpha = 0.8
        view.backgroundColor = .white
        view.toAutoLayout()
        return view
    }()
    
     lazy var detailedPhotoImage: UIImageView = {
        let imageView = UIImageView()
        if let image = selectedImage {
            imageView.image = UIImage(named: image)
        }
         imageView.contentMode = .scaleAspectFill
        imageView.toAutoLayout()
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.addSubview(transparentView)
        view.addSubview(detailedPhotoImage)
        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            detailedPhotoImage.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            detailedPhotoImage.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            detailedPhotoImage.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            transparentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            transparentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            transparentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            transparentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    @objc private func didTapCloseButton() {
        dismiss(animated: true)
    }
}

