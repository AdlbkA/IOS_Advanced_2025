import UIKit
import SwiftUI

final class HeroRouter {
    var rootViewController: UINavigationController?
    
    init (navigationController: UINavigationController) {
        self .rootViewController = navigationController
    }
    
    func showDetails(id: Int){
        let detailViewModel = DetailViewModel()
        let detailView = HeroDetailView(viewModel: detailViewModel, id: id)
        let detailVC = UIHostingController(rootView: detailView)
        rootViewController?.pushViewController(detailVC, animated: true)
    }
}
