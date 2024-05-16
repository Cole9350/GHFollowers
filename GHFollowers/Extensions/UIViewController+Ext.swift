//
//  UIViewController+Ext.swift
//  GHFollowers
//
//  Created by Shawn Cole on 5/16/24.
//

import UIKit

extension UIViewController {
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertViewController(alertTitle: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = . crossDissolve
            self.present(alertVC, animated: true)
        }
    }
}
