import UIKit
import Foundation

// MARK: - JSON

let jsonExample = """

{
    "name": "Furkan",
    "surname" : "Vural",
    "age" : 29,
    "isAvailable": true,
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

// MARK: - Decode (Coming Data)

struct Person: Codable {
    let name: String
    let surname: String
    let age: Int
    let isAvailable: Bool
}

do {
    let result = try JSONDecoder().decode(Person.self, from: jsonExample)
    let nameLabel = result.name
    let ageLabel = result.age
    print(nameLabel)
    print(ageLabel)
} catch {
    print(error.localizedDescription)
}

// MARK: - Encode (Sending Data)

// Button (Created User Button)
let person = Person(name: "Furkan", surname: "Vural", age: 24, isAvailable: true)

do {
    let sendingData = try JSONEncoder().encode(person)
    print(sendingData)
} catch {
    print(error.localizedDescription)
}


let socialMediaJson = """

{
    "user_name" : "furkanvural",
    "user_following" : 235,
    "user_followers" : 596
}

""".data(using: .utf8)!


struct SocialMediaPerson: Decodable {
    let userName: String
    let userFollowing: Int
    let userFollowers: Int
}

do {
    let jsonDecoder = JSONDecoder()
    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
    
    let person = try jsonDecoder.decode(SocialMediaPerson.self, from: socialMediaJson)
    print(person.userName)
} catch {
    print(error.localizedDescription)
}
