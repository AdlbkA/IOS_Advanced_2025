//
//  SuperHeroViewModel.swift
//  Assignment3
//
//  Created by Anuar Adilbek on 04.03.2025.
//

import Foundation

struct Hero: Decodable {
    var name: String?
    var appearance: Appearance?
    var biography: Biography?
    let images: Image
    var imageUrl: URL? {
        URL(string: images.md)
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

}





final class SuperHeroViewModel: ObservableObject {
    @Published var selectedHero: Hero?
    
    func fetchHero() async {
        guard
            let url = URL(string:
            "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/all.json")
        else {
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let heroes = try JSONDecoder().decode([Hero].self, from: data)
            let randomHero = heroes.randomElement()
            
            await MainActor.run {
                selectedHero = randomHero
            }
        }
        
        catch {
            print("Error: \(error)")
        }
    }
    
    
}
