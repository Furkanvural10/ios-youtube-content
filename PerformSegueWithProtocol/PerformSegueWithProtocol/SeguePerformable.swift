//
//  SeguePerformable.swift
//  PerformSegueWithProtocol
//
//  Created by furkan vural on 11.10.2023.
//

import Foundation
import UIKit

protocol SeguePerformable {
    
    func performSegue(identifier: String)
}

extension SeguePerformable where Self: UIViewController {
    
    func performSegue(identifier: String) {
        performSegue(withIdentifier: identifier, sender: self)
    }
}
