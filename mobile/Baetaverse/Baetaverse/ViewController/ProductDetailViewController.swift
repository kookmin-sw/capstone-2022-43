//
//  ProductDetailViewController.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/19.
//

import UIKit

final class ProductDetailViewController: UIViewController {
    
    private var id: Int?

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var hscodeLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var weightLabel: UILabel!
    @IBOutlet private weak var unitLabel: UILabel!
    @IBOutlet private weak var createdDateLabel: UILabel!
    
    private let viewModel = BUEstimateListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func passData(id: Int?) {
        self.id = id
    }
    
    private func fetchData() {
        Task {
            do {
                let (_, product) = try await viewModel.queryEstimateRequestDetail(id: id)
                updateUI(with: product)
            } catch {
                displayError(
                    error,
                    title: "제품 정보를 불러올 수 없습니다"
                )
            }
        }
    }
    
    private func updateUI(with product: Product) {
        nameLabel.text = product.name
        hscodeLabel.text = product.hsCode
        priceLabel.text = String(product.price)
        weightLabel.text = String(product.weight)
        unitLabel.text = product.standardUnit
        createdDateLabel.text = product.createdAt?.formatted() ?? ""
    }
    
}
