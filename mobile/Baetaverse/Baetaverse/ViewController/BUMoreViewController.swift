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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
