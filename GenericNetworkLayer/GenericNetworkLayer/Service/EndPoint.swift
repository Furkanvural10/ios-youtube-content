//
//  EndPoint.swift
//  GenericNetworkLayer
//
//  Created by furkan vural on 17.11.2023.
//

import Foundation


// https://jsonplaceholder.typicode.com/users


/*
 1- HTTPMethod (Get, Post, Delete, Patch) +
 2- Endpoint (BaseURL, path, method, headers, request) +
 3- NetworkError
 */

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case patch = "PATCH"
}

protocol EndPointDelegate {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var header: [String: String]? { get }
    
    func request() -> URLRequest
}


enum EndPoint {
    case getUser
    case postUser
    case updateUser
    case getAnimal
}


extension EndPoint: EndPointDelegate {
    var baseURL: String {
        return "https://jsonplaceholder.typicode.com"
    }
    
    var path: String {
        switch self {
        case .getUser:
            return "/users"
        case .postUser:
            return "/postUsers"
        case .updateUser:
            return "/updateUser"
        case .getAnimal:
            return "/getAnimal"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getUser:
            return .get
        case .postUser:
            return .post
        case .updateUser:
            return .post
        case .getAnimal:
            return .get
        }
    }
    
    var header: [String : String]? {
        return nil
    }
    
    func request() -> URLRequest {
        
        guard var component = URLComponents(string: baseURL) else { fatalError("Base URL Error") }
        component.path = path
        guard let url = component.url else { fatalError("URL Error From Component") }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if let header = header {
            header.forEach { key, value in
                request.setValue(key, forHTTPHeaderField: value)
            }
        }

        return request
    }
}




