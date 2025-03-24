import Foundation

final class HeroService {
    static let shared = HeroService()
    
    private init() {}
    
    private let baseURL = "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/"
    
    func fetchAll() async -> Result<[HeroApiModel], Error> {
        guard let url = URL(string: baseURL + "all.json") else {
            return .failure(URLError(.badURL))
        }
        
        let urlRequest = URLRequest(url: url)
        
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let heroes = try JSONDecoder().decode([HeroApiModel].self, from: data)
            
            return .success(heroes)
            
        } catch {
            return .failure(error)
        }
    }
    
    func fetchById(id: Int) async -> Result<HeroApiModel, Error> {
            guard let url = URL(string: baseURL + "id/\(id).json") else {
                return .failure(URLError(.badURL))
            }
            
            let urlRequest = URLRequest(url: url)
            
            do {
                let (data, _) = try await URLSession.shared.data(for: urlRequest)
                let hero = try JSONDecoder().decode(HeroApiModel.self, from: data)
                return .success(hero)
                
            } catch {
                return .failure(error)
            }
        }
}
