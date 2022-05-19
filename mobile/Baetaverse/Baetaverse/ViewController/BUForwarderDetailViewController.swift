//
//  BUForwarderDetailViewController.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/18.
//

import UIKit

final class BUForwarderDetailViewController: UIViewController {
    
    private var forwarder: UserProfile?
    
    @IBOutlet private weak var forwarderNameLabel: UILabel!
    @IBOutlet private weak var phoneNumberLabel: UILabel!
    @IBOutlet private weak var ceoNameLabel: UILabel!
    @IBOutlet private weak var officialPhoneNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func passData(forwarder: UserProfile?) {
        self.forwarder = forwarder
    }
    
    private func updateUI() {
        forwarderNameLabel.text = forwarder?.corporationName
        ceoNameLabel.text = forwarder?.name
        officialPhoneNumber.text = forwarder?.corporationNumber
        phoneNumberLabel.text = forwarder?.phoneNumber
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
