//
//  Extensions+UIViewController.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/15.
//

import UIKit

extension UIViewController {
    
    func displayError(_ error: Error, title: String) {
        guard let _ = viewIfLoaded?.window else { return }
        
        let alert = UIAlertController(
            title: title,
            message: error.localizedDescription,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(
            title: "확인",
            style: .default
        ))
        
        present(alert, animated: true)
    }
    
}
