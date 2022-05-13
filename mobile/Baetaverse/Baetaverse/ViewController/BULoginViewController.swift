//
//  BULoginViewController.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/03/13.
//

import UIKit

class BULoginViewController: UIViewController {
    
    private let viewModel = LoginViewModel()
    
    @IBOutlet private weak var idTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loadActivityIndicatorView: UIActivityIndicatorView!
    
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        Task {
            do {
                self.loadActivityIndicatorView.startAnimating()
                try await viewModel.login(
                    email: idTextField.text ?? "",
                    password: passwordTextField.text ?? ""
                )
                self.loadActivityIndicatorView.stopAnimating()
                self.performSegue(withIdentifier: "presentLoginMainSegue", sender: nil)
            } catch {
                self.loadActivityIndicatorView.stopAnimating()
                let alert = UIAlertController(
                    title: "로그인에 실패하였습니다!",
                    message: "계정을 다시 한번 확인해주세요!",
                    preferredStyle: .alert
                )
                alert.addAction(UIAlertAction(title: "확인", style: .default))
                present(alert, animated: true)
            }
        }
    }
    
    @IBAction func unwindToLoginBULoginView(_ segue: UIStoryboardSegue) { }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
