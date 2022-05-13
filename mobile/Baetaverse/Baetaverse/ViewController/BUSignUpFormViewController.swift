//
//  BUSignUpFormViewController.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/03/30.
//

import UIKit

final class BUSignUpFormViewController: UIViewController {
    
    private let viewModel = SignUpFormViewModel()
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBAction func signUpButtonClicked(_ sender: UIButton) {
        activityIndicatorView.startAnimating()
        
        do {
            try signUp()
        } catch {
            activityIndicatorView.stopAnimating()
            let alert = UIAlertController(
                title: "회원가입에 실패하였습니다!",
                message: "입력한 정보를 다시 한번 확인해주세요!",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "확인", style: .default))
            present(alert, animated: true)
            
        }
        
        activityIndicatorView.stopAnimating()
        
        let alert = UIAlertController(
            title: "회원가입에 성공하였습니다!",
            message: "배타버스를 즐겨보세요",
            preferredStyle: .alert
        )
        
        alert.addAction(
            UIAlertAction(
                title: "확인",
                style: .default
            ) { _ in
                self.performSegue(withIdentifier: "closeSignUpViewSegue", sender: nil)
            }
        )
        
        present(alert, animated: true)
    }
    
    private func signUp() throws {
        Task {
            try await viewModel.signUp(
                email: idTextField.text ?? "",
                password: passwordTextField.text ?? "",
                name: nameTextField.text ?? "",
                phoneNumber: phoneNumberTextField.text ?? ""
            )
        }
    }
    
}

extension BUSignUpFormViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
