//
//  BULoginViewController.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/03/13.
//

import UIKit

class BULoginViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindToLoginBULoginView(_ segue: UIStoryboardSegue) { }

}
