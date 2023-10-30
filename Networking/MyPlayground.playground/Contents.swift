import UIKit
import Foundation

// MARK: - JSON

let jsonExample = """

{
    "name": "Furkan",
    "surname" : "Vural",
    "age" : 29,
    "isAvailable": true
}

""".data(using: .utf8)!

do {
    
    let resultX = try JSONSerialization.jsonObject(with: jsonExample, options: .mutableContainers) as! [String: Any]

    if let name = resultX["name"],
       let surname = resultX["surname"] {
        print(name)
        print(surname)
    }
} catch {
    print(error.localizedDescription)
}


