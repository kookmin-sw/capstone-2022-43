//
//  BUEstimateDetailViewController.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/03/13.
//

import UIKit

class BUEstimateDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func declinedButtonClicked(_ sender: UIButton) {
        BUEstimateListViewController.estimateRecordCount -= 1
    }
    
    @IBAction func acceptButtonClicked(_ sender: UIButton) {
        let alertVC = UIAlertController(
            title: "견적 신청이 완료되었습니다.",
            message: "2시간 내로 포워더에게 상담 및 상담 안내가 없을 경우, 포워더의 상담 매칭률이 저하될 수 있습니다.",
            preferredStyle: .alert
        )
        alertVC.addAction(UIAlertAction(title: "확인", style: .default) { _ in
            
            self.navigationController?.popViewController(animated: true)
            
        })
        
        present(alertVC, animated: true)
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
