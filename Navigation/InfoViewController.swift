//
//  InfoViewController.swift
//  Navigation
//
//  Created by Никита Богданов on 12.03.2022.
//

import UIKit

class InfoViewController: UIViewController, UIAlertViewDelegate {

    @objc private func alertButtonAction() {
        let alert = UIAlertController(title: "Сообщение", message: "Это информационное сообщение", preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Отмена", style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
        }))
        alert.addAction(UIAlertAction(title: "ОК",
                                      style: UIAlertAction.Style.default,
                                      handler: {(_: UIAlertAction!) in
                                        print("Информационное сообщение в консоль")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    // create button to show the alert
    private lazy var alertButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.layer.cornerRadius = 12
        button.setTitle("Сообщение", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(alertButtonAction), for: .touchUpInside)
        button.toAutoLayout()
        return button
    }()
    
    private func setupAlertButton() {
            self.view.addSubview(self.alertButton)
            self.alertButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
            self.alertButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
            self.alertButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
            self.alertButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        setupAlertButton()
    }

}
