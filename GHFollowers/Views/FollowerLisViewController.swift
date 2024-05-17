//
//  FollowerLisViewController.swift
//  GHFollowers
//
//  Created by Shawn Cole on 5/16/24.
//

import UIKit

class FollowerLisViewController: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { followers, error in
            guard let followers else {
                if let error {
                    self.presentGFAlertOnMainThread(title: "Error", message: error.rawValue, buttonTitle: "Ok")
                }
                return
            }
            print(followers)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
