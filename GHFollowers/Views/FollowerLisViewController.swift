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
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
