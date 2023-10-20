//
//  ViewController.swift
//  TableView
//
//  Created by furkan vural on 20.10.2023.
//

import UIKit

class ViewController: UIViewController {
       
    @IBOutlet weak var movieTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        movieTableView.delegate = self
        movieTableView.dataSource = self
        
        
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = "Cell View"
        cell.contentConfiguration = content
        
        return cell
    }
    
    
}


