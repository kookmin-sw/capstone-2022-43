//
//  BULoginViewController.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/03/13.
//

import UIKit

final class BULoginViewController: UIViewController {
    
    private let viewModel = LoginViewModel()
    
    @IBOutlet private weak var idTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loadActivityIndicatorView: UIActivityIndicatorView!
    
    @IBAction func unwindToLoginBULoginView(_ segue: UIStoryboardSegue) { }
    
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        Task {
            do {
                loadActivityIndicatorView.startAnimating()
                try await login()
                loadActivityIndicatorView.stopAnimating()
                performSegue(
                    withIdentifier: "presentLoginMainSegue",
                    sender: nil
                )
            } catch {
                loadActivityIndicatorView.stopAnimating()
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
    
    private func login() async throws {
        try await viewModel.login(
            email: idTextField.text ?? "",
            password: passwordTextField.text ?? ""
        )
    }
    
}

extension BULoginViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
