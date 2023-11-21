

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getUser()
    }
    
    private func getUser() {
        UserNetwork.shared.getUser { result in
            switch result {
            case .success(let success):
                print(success.map({ $0.name }))
            case .failure(let failure):
                print(failure.rawValue)
            }
        }
    }
    
    
}

