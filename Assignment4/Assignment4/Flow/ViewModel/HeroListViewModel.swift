import Foundation
import SwiftUI

@MainActor
final class HeroViewModel: ObservableObject {
    @Published var heroes: [HeroModel] = []
    
    private var router: HeroRouter
    
    init(router: HeroRouter) {
        self.router = router
    }
    
    func loadHeroes() async {
        let result = await HeroService.shared.fetchAll()
        
        switch result{
        case .success(let heroes):
            self.heroes = heroes.map{
                HeroModel(
                    id: $0.id,
                    title: $0.name,
                    description: $0.biography.placeOfBirth ?? "None discription",
                    apperance: $0.appearance?.hairColor ?? "Black",
                    publisher: $0.biography.publisher ?? "No publisher",
                    imageUrl: $0.imageUrl
                    
                )
            }
        case .failure(let error):
            print("\(error.localizedDescription)")
        }
    }
    
    func showDetailView(id: Int) {
        router.showDetails(id: id)
    }
    
    
}
