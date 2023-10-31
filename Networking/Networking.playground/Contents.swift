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


let json1 = """

{
    "user_NAME" : "furkanvural",
    "user_FOLLOWING" : 235,
    "user_FOLLOWERS" : 596,
    "dkjasnasdjasndk" : "ondsl2394"
}

""".data(using: .utf8)!


struct Person: Decodable {

    private enum CodingKeys: String, CodingKey {
        case userName = "user_NAME"
        case userFollowing = "user_FOLLOWING"
        case userFollowers = "user_FOLLOWERS"
        case irrelevantData = "dkjasnasdjasndk"
    }

    let userName: String
    let userFollowing: Int
    let userFollowers: Int
    let irrelevantData: String

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userName = try container.decode(String.self, forKey: .userName)
        self.userFollowers = try container.decode(Int.self, forKey: .userFollowers)
        self.userFollowing = try container.decode(Int.self, forKey: .userFollowing)
        self.irrelevantData = try container.decode(String.self, forKey: .irrelevantData)
    }
}

do {
    let result = try JSONDecoder().decode(Person.self, from: json1)
    print(result.irrelevantData)

} catch {
    print(error.localizedDescription)
}


let json2 = """

[
    {
        "date_of_birth": "27.01.1996",
        "user_name" : "Ali",
        "user_surname" : "Veli",
    },
    {
        "date_of_birth": "05.11.1989",
        "user_name" : "John",
        "user_surname" : "Ken",
    },
    {
        "date_of_birth": "10.08.2020",
        "user_name" : "Can",
        "user_surname" : "Uç",
    }
]

""".data(using: .utf8)!

struct Person: Decodable {

    private enum CodingKeys: String, CodingKey {
        case userName = "user_name"
        case userSurname = "user_surname"
        case birthDate = "date_of_birth"
    }

    let userName: String
    let userSurname: String
    let birthDate: Date

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userName = try container.decode(String.self, forKey: .userName)
        self.userSurname = try container.decode(String.self, forKey: .userSurname)
        self.birthDate = try container.decode(Date.self, forKey: .birthDate)
    }

}


do {
    let result = try JSONDecoder().decode([Person].self, from: json2)
    let userNameList = result.map { $0.birthDate }
    print(userNameList)
} catch {
    print(error.localizedDescription)
}

let json3 = """
{
        "date": "27.01.1996",
        "name" : "Ali",
        "surname" : "Veli",
}

""".data(using: .utf8)!


struct Person10: Decodable {
    let name: String
    let surname: String
    let date: Date
}

do {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd.MM.yy"
    let jsonDecoder = JSONDecoder()
    jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
    
    let result = try jsonDecoder.decode(Person10.self, from: json3)
    print(result.date)
} catch {
    print(error.localizedDescription)
}


let personJson = """

{
  "person": {
    "name": "John Doe",
    "age": 30,
    "address": {
      "street": "123 Main St",
      "city": "Anytown",
      "zipcode": "12345"
    },
    "email": "john.doe@example.com",
  }
}

""".data(using: .utf8)!
