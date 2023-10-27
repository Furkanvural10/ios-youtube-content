//
//  ProductTableViewCell.swift
//  TableView
//
//  Created by furkan vural on 27.10.2023.
//

import UIKit


protocol ProductTableViewCellInterface: AnyObject {
    func clickedFavButton(for cell: ProductTableViewCell)
    func clickedBuyButton(for cell: ProductTableViewCell)
}

class ProductTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    weak var delegate: ProductTableViewCellInterface?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    @IBAction func favoriteButtonClicked(_ sender: Any) {
        delegate?.clickedFavButton(for: self)
    }
    
    @IBAction func buyButtonClicked(_ sender: Any) {
        delegate?.clickedBuyButton(for: self)
    }
    
    
}
