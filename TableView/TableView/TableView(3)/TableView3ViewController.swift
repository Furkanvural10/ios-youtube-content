//
//  TableView3ViewController.swift
//  TableView
//
//  Created by furkan vural on 27.10.2023.
//

import UIKit

final class TableView3ViewController: UIViewController {
    
    @IBOutlet weak var productTableView: UITableView!
    var productList: [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        prepareList()
    }
    
    private func setupTableView() {
        productTableView.delegate = self
        productTableView.dataSource = self
    }
    
    private func prepareList() {
        productList.append(Product(name: "Tshirt", price: "100"))
        productList.append(Product(name: "Pant", price: "200"))
        productList.append(Product(name: "Shoes", price: "300"))
        productList.append(Product(name: "Shirt", price: "400"))
        productList.append(Product(name: "Accesories", price: "500"))
    }
}

extension TableView3ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productTableView.dequeueReusableCell(withIdentifier: "productID") as! ProductTableViewCell
        cell.productNameLabel.text = productList[indexPath.row].name
        cell.priceLabel.text = productList[indexPath.row].price
        cell.delegate = self
        return cell
    }
}

extension TableView3ViewController: ProductTableViewCellInterface {
    func clickedFavButton(for cell: ProductTableViewCell) {
        if let indexPath = productTableView.indexPath(for: cell) {
            print("Favorite prod: \(productList[indexPath.row])")
        }
    }
    
    func clickedBuyButton(for cell: ProductTableViewCell) {
        if let indexPath = productTableView.indexPath(for: cell) {
            print("Buy prod: \(productList[indexPath.row])")
        }
    }
    
    

}


