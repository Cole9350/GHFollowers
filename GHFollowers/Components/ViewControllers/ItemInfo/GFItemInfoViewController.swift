//
//  GFItemInfoViewController.swift
//  GHFollowers
//
//  Created by Shawn Cole on 5/17/24.
//

import UIKit

class GFItemInfoViewController: UIViewController {
    
    let stackView = UIStackView()
    let itemInfoView1 = GFItemInfoView()
    let itemInfoView2 = GFItemInfoView()
    let actionbutton = GFButton()
    
    var user: User!
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackgroundView()
        layoutUI()
        configureStackView()
    }
    
    func configureBackgroundView() {
        view.layer.cornerRadius = 18
        view.backgroundColor = .secondarySystemBackground
    }
    
    func configureStackView() {
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(itemInfoView1)
        stackView.addArrangedSubview(itemInfoView2)
    }
    
    private func layoutUI() {
        view.addSubview(stackView)
        view.addSubview(actionbutton)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            
            actionbutton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
            actionbutton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            actionbutton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            actionbutton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
}
