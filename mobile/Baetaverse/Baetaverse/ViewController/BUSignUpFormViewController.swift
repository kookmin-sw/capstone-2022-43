//
//  BUSignUpFormViewController.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/03/30.
//

import UIKit

class BUSignUpFormViewController: UIViewController {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
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
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        Task {
            do {
                activityIndicatorView.startAnimating()
                try await appService?.signUp(
                    email: idTextField.text ?? "",
                    password: passwordTextField.text ?? "",
                    name: nameTextField.text ?? ""
                )
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
                    )
                )
                performSegue(withIdentifier: "closeSignUpViewSegue", sender: nil)
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
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
