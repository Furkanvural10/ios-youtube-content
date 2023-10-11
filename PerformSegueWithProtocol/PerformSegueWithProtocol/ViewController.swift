//
//  ViewController.swift
//  PerformSegueWithProtocol
//
//  Created by furkan vural on 11.10.2023.
//

import UIKit

class ViewController: UIViewController, SeguePerformable {

    @IBOutlet weak var productNameLabel: UILabel!
    var productColor: String = "Black"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func getDetailButtonClicked(_ sender: Any) {
        
//        performSegue(withIdentifier: "toDetailVC", sender: productColor)
        self.performSegue(identifier: "toDetailVC")
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
                let destination = segue.destination as! DetailProductViewController
                destination.comingProductColor = productColor
        }
    }

    @IBAction func secondButton(_ sender: Any) {
        
        performSegue(withIdentifier: "toProfileVC", sender: nil)
    }
    
    
}

