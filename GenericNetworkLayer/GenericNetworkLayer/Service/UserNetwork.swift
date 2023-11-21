//
//  UserNetwork.swift
//  GenericNetworkLayer
//
//  Created by furkan vural on 21.11.2023.
//

import Foundation

protocol UserNetworkDelegate {
    
    func getUser(completion: @escaping (Result<[User], NetworkError>) -> Void)
}

final class UserNetwork: UserNetworkDelegate {
    
    static let shared = UserNetwork()
    
    private init() {}
    
    
    func getUser(completion: @escaping (Result<[User], NetworkError>) -> Void) {
        
        let endPoint = EndPoint.getUser
        NetworkManager.shared.request(endPoint, completion: completion)
        
    }
    
    
    
}
