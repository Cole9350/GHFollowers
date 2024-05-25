//
//  GFRepoItemViewController.swift
//  GHFollowers
//
//  Created by Shawn Cole on 5/17/24.
//

import UIKit

class GFRepoItemViewController: GFItemInfoViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoView1.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoView2.set(itemInfoType: .gists, withCount: user.publicGists)
        actionbutton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
    }
}
