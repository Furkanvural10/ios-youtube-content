//
//  DetailProductViewController.swift
//  PerformSegueWithProtocol
//
//  Created by furkan vural on 11.10.2023.
//

import UIKit

class DetailProductViewController: UIViewController {

    @IBOutlet weak var productDetailLabel: UILabel!
    
    var comingProductColor: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        guard let color = comingProductColor else { return }
        productDetailLabel.text = color
    }
    
    @IBAction func buyButtonClicked(_ sender: Any) {
        let price = "100£"
        performSegue(withIdentifier: "toCompletedVC", sender: price)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCompletedVC" {
            if let price = sender as? String {
                let destination = segue.destination as! CompletedProdcutViewController
                destination.comingPrice = price
            }
        }
    }
    
    
    

}

