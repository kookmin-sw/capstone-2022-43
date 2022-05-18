//
//  BUMoreViewController.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/17.
//

import UIKit

final class BUMoreViewController: UIViewController {
    
    private let viewModel = MoreViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutButtonClicked(_ sender: UIButton) {
        viewModel.logout()
        performSegue(
            withIdentifier: "logoutSegue",
            sender: nil
        )
    }
    
    @IBAction func serviceInfoButtonClicked(_ sender: UIButton) {
        if let url = URL(string: "https://kookmin-sw.github.io/capstone-2022-43/") {
            UIApplication.shared.open(url)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
