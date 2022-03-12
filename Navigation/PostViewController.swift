//
//  PostViewController.swift
//  Navigation
//
//  Created by Никита Богданов on 12.03.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    var titlePost: String = ""
    
    @objc func infoAction() {
        let infoViewController = InfoViewController()
        self.navigationController?.present(infoViewController, animated: true, completion: nil)
    }
    
    private func setupView(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = titlePost
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage (systemName: "info.circle"), style: .plain, target: self, action: #selector(infoAction))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

    }
    
}
