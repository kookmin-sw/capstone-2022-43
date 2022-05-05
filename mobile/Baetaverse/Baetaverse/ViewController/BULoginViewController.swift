//
//  BULoginViewController.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/03/13.
//

import UIKit

class BULoginViewController: UIViewController {
    
    @IBOutlet private weak var idTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loadActivityIndicatorView: UIActivityIndicatorView!
    
    private var appService: AppService? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return appDelegate.appService
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func loginButtonClicked(_ sender: UIButton) {
        Task {
            do {
                self.loadActivityIndicatorView.startAnimating()
                try await appService?.login(
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
