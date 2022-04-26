//
//  TabBar.swift
//  Navigation
//
//  Created by Никита Богданов on 12.03.2022.
//

import UIKit

class TabBar: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        createArrayOfViewControllers()
        
        self.delegate = self
    }
    
    private func createArrayOfViewControllers() {
        viewControllers = [
            createNavigationController(for: FeedViewController(), title: NSLocalizedString("Лента", comment: ""), image: UIImage(systemName: "house")!),
            createNavigationController(for: LogInViewController(), title: NSLocalizedString("Профиль", comment: ""), image: UIImage(systemName: "person")!)
                ]
        }
    
    private func createNavigationController(for rootViewController: UIViewController,
                                                    title: String,
                                                    image: UIImage) -> UIViewController {
          let navController = UINavigationController(rootViewController: rootViewController)
          navController.tabBarItem.title = title
          navController.tabBarItem.image = image
          navController.navigationBar.prefersLargeTitles = false
          rootViewController.navigationItem.title = title
          return navController
      }
}

