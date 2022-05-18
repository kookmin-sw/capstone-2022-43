//
//  BUEstimateDetailViewController.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/03/13.
//

import UIKit

final class BUEstimateDetailViewController: UIViewController {
    
    private var estimate: QuotationEntity?
    
    @IBOutlet private weak var forwarderNameLabel: UILabel!
    @IBOutlet private weak var oceanFreightPriceLabel: UILabel!
    @IBOutlet private weak var inlandFreightPriceLabel: UILabel!
    @IBOutlet private weak var totalPriceLabel: UILabel!
    @IBOutlet private weak var totalTimeLabel: UILabel!
    
    private var phoneNumber: URL? {
        let string = "tel://" + (estimate?.forwarder.phoneNumber ?? "")
        return URL(string: string)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func acceptButtonClicked(_ sender: UIButton) {
        let alertVC = UIAlertController(
            title: "견적 신청이 완료되었습니다.",
            message: "2시간 내로 포워더에게 상담 및 상담 안내가 없을 경우, 포워더의 상담 매칭률이 저하될 수 있습니다.",
            preferredStyle: .alert
        )
        alertVC.addAction(UIAlertAction(title: "확인", style: .default) { _ in
            guard let phoneNumber = self.phoneNumber else { return }
            UIApplication.shared.open(phoneNumber)
            self.navigationController?.popViewController(animated: true)
        })
        present(alertVC, animated: true)
    }
    
    func passData(estimate: QuotationEntity?) {
        self.estimate = estimate
    }
    
    private func updateUI() {
        forwarderNameLabel.text = estimate?.forwarder.corporationName
        oceanFreightPriceLabel.text = String(estimate?.estimate.oceanFreightPrice ?? 0)
        inlandFreightPriceLabel.text = String(estimate?.estimate.inlandFreightPrice ?? 0)
        totalPriceLabel.text = String(estimate?.estimate.totalPrice ?? 0)
        totalTimeLabel.text = String(estimate?.estimate.estimatedTime ?? 0)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? BUForwarderDetailViewController {
            detailVC.passData(forwarder: self.estimate?.forwarder)
        }
    }

}
