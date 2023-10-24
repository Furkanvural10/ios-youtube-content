//
//  TableViewController.swift
//  TableView
//
//  Created by furkan vural on 24.10.2023.
//

import UIKit

class TableViewController: UIViewController {

    @IBOutlet weak var productTableView: UITableView!
    
    var productList: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareList()
        setupTableView()
        

    }
    
    private func prepareList() {
        productList.append(Product(name: "Tshirt", price: "100"))
        productList.append(Product(name: "Pant", price: "200"))
        productList.append(Product(name: "Shoes", price: "300"))
        productList.append(Product(name: "Shirt", price: "400"))
        productList.append(Product(name: "Accesories", price: "500"))
    }
    
    private func setupTableView() {
        productTableView.delegate = self
        productTableView.dataSource = self
    }
    
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = productList[indexPath.row].name
        content.secondaryText = productList[indexPath.row].price
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected product: \(productList[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Silinecek product : \(productList[indexPath.row])")
            productList.remove(at: indexPath.row)
            
            DispatchQueue.main.async {
                self.productTableView.reloadData()
            }
        }
    }
    
    
    
    
    
}
