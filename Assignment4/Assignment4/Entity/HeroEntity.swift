import Foundation


struct HeroApiModel: Decodable {
    var id: Int
    var name: String
    var appearance: Appearance?
    var biography: Biography
    let images: Image
    var imageUrl: URL? {
        URL(string: images.md)
    }

}

struct Image: Decodable {
    let md: String
}

struct Appearance: Decodable {
    var gender: String?
    var race: String?
    var height: Array<String>?
    var weight: Array<String>?
    var hairColor: String?
}

struct Biography: Decodable {
    var fullName: String?
    var placeOfBirth: String?
    var publisher: String?
}
