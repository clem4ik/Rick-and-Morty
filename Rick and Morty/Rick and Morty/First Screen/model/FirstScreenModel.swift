

import Foundation

// MARK: - Welcome
struct ArrCharacter: Decodable {
    let results: [Character2]
}
// MARK: - Result
struct Character2: Decodable {
    let id: Int
    let name: String
    let species: Species
    let type: String
    let gender: Gender
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
    
    
    var gender: String{
        switch self{
        case .female:
            let gender = "Fealm"
            return gender
        case .male:
            let gender = "Male"
            return gender
        case .unknown:
            let gender = "unknown"
            return gender
        }
    }
    
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let url: String
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

