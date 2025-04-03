import Foundation
import SwiftUI

final class ImageViewModel: ObservableObject {
    @Published var images: [ImageModel] = []
    @Published var errorMessage: ErrorMessage?
    
    func getImages(){
        var tempImages: [ImageModel] = []
        let group = DispatchGroup()
        
        let urlStrings: [String] = (0...5).map { _ in
            "https://picsum.photos/id/\(Int.random(in: 0...500))/500"
        }
        
        for url in urlStrings {
            group.enter()
            downloadImage(urlString: url) { model in
                if let model = model {
                    tempImages.append(model)
                    group.leave()
                }
            }
        }
        
        group.notify(queue: .main) {
            self.images += tempImages
        }
    }
    
    private func downloadImage(urlString: String, completion: @escaping (ImageModel?) -> Void) {
        guard let url = URL(string: urlString) else {return}
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage?.message = "Error downloading image: \(error.localizedDescription)"
                }
                completion(nil)
                return
            }
            
            if let safeData = data {
                guard let image = UIImage(data: safeData) else {
                    DispatchQueue.main.async {
                        self.errorMessage?.message = "Failed to decode image \(urlString)"
                    }
                    completion(nil)
                    return
                }
                
                
                let convertedImage = Image(uiImage: image)
                let model = ImageModel(image: convertedImage)
                completion(model)
            }
            
        }
        .resume()
    }
    
}
