//
//  CompletedProdcutViewController.swift
//  PerformSegueWithProtocol
//
//  Created by furkan vural on 11.10.2023.
//

import UIKit

class CompletedProdcutViewController: UIViewController {

    @IBOutlet weak var productPriceLabel: UILabel!
    var comingPrice: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupView()

    }
    
    private func setupView() {
        guard let price = comingPrice else { return }
        productPriceLabel.text = price
    }
 
 
    @IBAction func completedButtonClicked(_ sender: Any) {
//        navigationController?.popViewController(animated: true)
        navigationController?.popToRootViewController(animated: true)
    }
    
}
