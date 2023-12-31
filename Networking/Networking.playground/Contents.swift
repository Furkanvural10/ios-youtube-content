import UIKit
import Foundation

// MARK: - JSON

//let jsonExample = """
//
//{
//    "name": "Furkan",
//    "surname" : "Vural",
//    "age" : 29,
//    "isAvailable": true,
//}
//
//""".data(using: .utf8)!
//
//do {
//
//    let resultX = try JSONSerialization.jsonObject(with: jsonExample, options: .mutableContainers) as! [String: Any]
//
//    if let name = resultX["name"],
//       let surname = resultX["surname"] {
//        print(name)
//        print(surname)
//    }
//} catch {
//    print(error.localizedDescription)
//}
//
//// MARK: - Decode (Coming Data)
//
//struct Person: Codable {
//    let name: String
//    let surname: String
//    let age: Int
//    let isAvailable: Bool
//}
//
//do {
//    let result = try JSONDecoder().decode(Person.self, from: jsonExample)
//    let nameLabel = result.name
//    let ageLabel = result.age
//    print(nameLabel)
//    print(ageLabel)
//} catch {
//    print(error.localizedDescription)
//}
//
//// MARK: - Encode (Sending Data)
//
//// Button (Created User Button)
//let person = Person(name: "Furkan", surname: "Vural", age: 24, isAvailable: true)
//
//do {
//    let sendingData = try JSONEncoder().encode(person)
//    print(sendingData)
//} catch {
//    print(error.localizedDescription)
//}
//
//
//let socialMediaJson = """
//
//{
//    "user_name" : "furkanvural",
//    "user_following" : 235,
//    "user_followers" : 596
//}
//
//""".data(using: .utf8)!
//
//
//struct SocialMediaPerson: Decodable {
//    let userName: String
//    let userFollowing: Int
//    let userFollowers: Int
//}
//
//do {
//    let jsonDecoder = JSONDecoder()
//    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
//
//    let person = try jsonDecoder.decode(SocialMediaPerson.self, from: socialMediaJson)
//    print(person.userName)
//} catch {
//    print(error.localizedDescription)
//}
//
//
//let json1 = """
//
//{
//    "user_NAME" : "furkanvural",
//    "user_FOLLOWING" : 235,
//    "user_FOLLOWERS" : 596,
//    "dkjasnasdjasndk" : "ondsl2394"
//}
//
//""".data(using: .utf8)!
//
//
//struct Person1: Decodable {
//
//    private enum CodingKeys: String, CodingKey {
//        case userName = "user_NAME"
//        case userFollowing = "user_FOLLOWING"
//        case userFollowers = "user_FOLLOWERS"
//        case irrelevantData = "dkjasnasdjasndk"
//    }
//
//    let userName: String
//    let userFollowing: Int
//    let userFollowers: Int
//    let irrelevantData: String
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.userName = try container.decode(String.self, forKey: .userName)
//        self.userFollowers = try container.decode(Int.self, forKey: .userFollowers)
//        self.userFollowing = try container.decode(Int.self, forKey: .userFollowing)
//        self.irrelevantData = try container.decode(String.self, forKey: .irrelevantData)
//    }
//}
//
//do {
//    let result = try JSONDecoder().decode(Person1.self, from: json1)
//    print(result.irrelevantData)
//
//} catch {
//    print(error.localizedDescription)
//}
//
//
//let json2 = """
//
//[
//    {
//        "date_of_birth": "27.01.1996",
//        "user_name" : "Ali",
//        "user_surname" : "Veli",
//    },
//    {
//        "date_of_birth": "05.11.1989",
//        "user_name" : "John",
//        "user_surname" : "Ken",
//    },
//    {
//        "date_of_birth": "10.08.2020",
//        "user_name" : "Can",
//        "user_surname" : "Uç",
//    }
//]
//
//""".data(using: .utf8)!
//
//struct Person2: Decodable {
//
//    private enum CodingKeys: String, CodingKey {
//        case userName = "user_name"
//        case userSurname = "user_surname"
//        case birthDate = "date_of_birth"
//    }
//
//    let userName: String
//    let userSurname: String
//    let birthDate: Date
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.userName = try container.decode(String.self, forKey: .userName)
//        self.userSurname = try container.decode(String.self, forKey: .userSurname)
//        self.birthDate = try container.decode(Date.self, forKey: .birthDate)
//    }
//
//}
//
//
//do {
//    let result = try JSONDecoder().decode([Person2].self, from: json2)
//    let userNameList = result.map { $0.birthDate }
//    print(userNameList)
//} catch {
//    print(error.localizedDescription)
//}
//
//let json3 = """
//{
//        "date": "27.01.1996",
//        "name" : "Ali",
//        "surname" : "Veli",
//}
//
//""".data(using: .utf8)!
//
//
//struct Person10: Decodable {
//    let name: String
//    let surname: String
//    let date: Date
//}
//
//do {
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "dd.MM.yy"
//    let jsonDecoder = JSONDecoder()
//    jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
//
//    let result = try jsonDecoder.decode(Person10.self, from: json3)
//    print(result.date)
//} catch {
//    print(error.localizedDescription)
//}
//
//
//let personJson = """
//
//{
//  "person": {
//    "name": "John Doe",
//    "age": 30,
//    "address": {
//      "street": "123 Main St",
//      "city": "Anytown",
//      "zipcode": "12345"
//    },
//    "email": "john.doe@example.com",
//  }
//}
//
//""".data(using: .utf8)!
//
//struct DetailAddressInfo1: Decodable {
//
//    let street: String
//    let city: String
//    let zipcode: String
//}
//
//struct PersonDetail1: Decodable {
//
//    let name: String
//    let age: Int
//    let address: DetailAddressInfo1
//    let email: String
//}
//
//struct Person3: Decodable {
//    let person: PersonDetail1
//}
//
//
//do {
//    let result = try JSONDecoder().decode(Person3.self, from: personJson)
//    print(result.person.address.street)
//} catch {
//    print(error.localizedDescription)
//}
//
//
//let personJson2 = """
//[
//  {
//    "person": {
//      "name": "John Doe",
//      "age": 30,
//      "address": {
//        "street": "123 Main St",
//        "city": "Anytown",
//        "zipcode": "12345"
//      },
//      "email": "john.doe@example.com"
//    }
//  },
//  {
//    "person": {
//      "name": "Alice Smith",
//      "age": 25,
//      "address": {
//        "street": "456 Elm St",
//        "city": "Sometown",
//        "zipcode": "67890"
//      },
//      "email": "alice.smith@example.com"
//    }
//  },
//  {
//    "person": {
//      "name": "John Doe",
//      "age": 30,
//      "address": {
//        "street": "567 Main St",
//        "city": "Anytown",
//        "zipcode": "12345"
//      },
//      "email": "john.doe@example.com"
//    }
//  },
//  {
//    "person": {
//      "name": "Alice Smith",
//      "age": 25,
//      "address": {
//        "street": "909 Elm St",
//        "city": "Sometown",
//        "zipcode": "67890"
//      },
//      "email": "alice.smith@example.com"
//    }
//  },
//  {
//    "person": {
//      "name": "John Doe",
//      "age": 30,
//      "address": {
//        "street": "000 Main St",
//        "city": "Anytown",
//        "zipcode": "12345"
//      },
//      "email": "john.doe@example.com"
//    }
//  },
//  {
//    "person": {
//      "name": "Alice Smith",
//      "age": 25,
//      "address": {
//        "street": "823189213 Elm St",
//        "city": "Sometown",
//        "zipcode": "67890"
//      },
//      "email": "alice.smith@example.com"
//    }
//  }
//]
//""".data(using: .utf8)!
//
//struct DetailAddressInfo2: Decodable {
//
//    let street: String
//    let city: String
//    let zipcode: String
//}
//
//struct PersonDetail2: Decodable {
//
//    let name: String
//    let age: Int
//    let address: DetailAddressInfo2
//    let email: String
//}
//
//struct Person4: Decodable {
//    let person: PersonDetail2
//}
//
//do {
//    let result = try JSONDecoder().decode([Person4].self, from: personJson2)
//    let streetList = result.map { $0.person.address.street }
//    print(streetList)
//} catch {
//    print(error.localizedDescription)
//}
//
//// MARK: - Arbitary Types
//
//let jsonExample11 = """
//
//    {
//        "name": "Furkan",
//        "zero" : "true",
//    }
//""".data(using: .utf8)!
//
//struct CustomDecodeType: Decodable {
//
//    let value: Any
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if let stringType = try? container.decode(String.self) {
//            self.value = stringType
//        } else if let boolType = try? container.decode(Bool.self) {
//            self.value = boolType
//        } else if let intType = try? container.decode(Int.self) {
//            self.value = intType
//        } else {
//            self.value = Double()
//        }
//    }
//}
//
//
//struct Person5: Decodable {
//    let name: String
//    let zero: CustomDecodeType
//}
//
//do {
//    let result = try JSONDecoder().decode(Person5.self, from: jsonExample11)
//    print(result.name)
//    print(result.zero.value is Bool)
//} catch {
//    print(error.localizedDescription)
//}

//
//let json0 = """
//[
//    {
//        "name": "Ford",
//        "price": "1.2",
//        "electric" :false,
//        "kw": 0,
//        "batteryId" : ""
//    },
//    {
//        "name": "Tesla",
//        "price": "1.6",
//        "electric" :true,
//        "kw": 234,
//        "batteryId" : "332UJF"
//    },
//    {
//        "name": "Mercedes",
//        "price": "2.5",
//        "electric" :false,
//        "kw": 0,
//        "batteryId" : "0"
//    },
//    {
//        "name": "Bmw",
//        "price": "2",
//        "electric" :true,
//        "kw": 5673,
//        "batteryId" : "823NJS"
//    }
//]
//
//""".data(using: .utf8)!
//
//class Car: Decodable {
//    let name: String
//    let price: String
//
//}
//
//class ElectricCar: Car {
//
//    private enum CodingKeys: CodingKey {
//        case electric
//        case kw
//        case batteryId
//    }
//
//    let electric: Bool
//    let kw: Int
//    let batteryId: String
//
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.electric = try container.decode(Bool.self, forKey: .electric)
//        self.kw = try container.decode(Int.self, forKey: .kw)
//        self.batteryId = try container.decode(String.self, forKey: .batteryId)
//        try super.init(from: decoder)
//    }
//}
//
//do {
//    let result = try JSONDecoder().decode([ElectricCar].self, from: json0)
//    let eCarList = result.filter { $0.electric }.map { $0.name }
//    let nonECarList = result.filter { !$0.electric }.map { $0.name }
//    print(eCarList)
//    print(nonECarList)
//} catch {
//    print(error.localizedDescription)
//}


//let flatJson = """
//
//{
//    "name": "Furkan",
//    "surname" : "Vural",
//    "age" : 20,
//    "address" : {
//            "city": "Istanbul",
//            "country": "Turkey"
//        }
//}
//
//""".data(using: .utf8)!
//
//struct PersonFlatModel: Decodable {
//
//    private enum CodingKeys: CodingKey {
//        case name
//        case surname
//        case age
//        case address
//    }
//
//    private enum NestedCodingKeys: CodingKey {
//        case city
//        case country
//    }
//
//    let name: String
//    let surname: String
//    let age: Int
//
//    let city: String
//    let country: String
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.surname = try container.decode(String.self, forKey: .surname)
//        self.age = try container.decode(Int.self, forKey: .age)
//
//        let addressContainer = try container.nestedContainer(keyedBy: NestedCodingKeys.self, forKey: .address)
//        self.city = try addressContainer.decode(String.self, forKey: .city)
//        self.country = try addressContainer.decode(String.self, forKey: .country)
//    }
//}
//
//
//do {
//    let result = try JSONDecoder().decode(PersonFlatModel.self, from: flatJson)
//    print(result.country)
//    print(result.age)
//    print(result.city)
//} catch {
//    print(error.localizedDescription)
//}


let json = """
{
    "speed" : ["150.44,81.231101512"]
     
}
""".data(using: .utf8)!

struct ConvertSpeed: Decodable {
    
    let kmh: Double
    let knot: Double
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        print(string)
        
        let values = string.components(separatedBy: ",")
        print(values)
        
        guard values.count == 2,
              let kmh = Double(values[0]),
              let knot = Double(values[1]) else {
                  throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: container.codingPath, debugDescription: "Invalid coordinates"))
              }
        
        self.kmh = kmh
        self.knot = knot
    }
}


struct SpeedModel: Decodable {
    let speed: [ConvertSpeed]
}

do {
    let result = try JSONDecoder().decode(SpeedModel.self, from: json)
    print(result.speed[0].kmh)
    print(result.speed[0].knot)
} catch {
    print(error.localizedDescription)
}
