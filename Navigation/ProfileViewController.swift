//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Никита Богданов on 27.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    var profileView: ProfileHeaderView { return self.view as! ProfileHeaderView }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = ProfileHeaderView(frame: UIScreen.main.bounds)

    }
    
}
