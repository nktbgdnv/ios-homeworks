//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Никита Богданов on 27.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        // from previous task
        self.view = ProfileHeaderView(frame: UIScreen.main.bounds)

    }

    
}

