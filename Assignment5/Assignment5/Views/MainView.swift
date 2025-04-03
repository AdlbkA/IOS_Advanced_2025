import SwiftUI

struct MainView: View {
    @StateObject var imageViewModel: ImageViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack{
            Color(.gray)
                .ignoresSafeArea()
                .opacity(0.2)
            ScrollView {
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(imageViewModel.images) { model in
                        cell(for: model)
                    }
                }
                .padding(12)
            }
            .onAppear {
                imageViewModel.getImages()
            }
            .alert(item: $imageViewModel.errorMessage) { errorMessage in
                Alert(
                    title: Text("Error"),
                    message: Text(errorMessage.message),
                    dismissButton: .default(Text("OK"))
                )
            }
            
        }
        Button("Load more photos") {
            imageViewModel.getImages()
        }.buttonStyle(.bordered)
        
    }
    
    
    private func cell(for model: ImageModel) -> some View {
        model.image
            .resizable()
            .scaledToFit()
            .cornerRadius(16)
            .frame(height: 200)
            .shadow(radius: 4)
    }
}

#Preview {
    let imageViewModel = ImageViewModel()
    MainView(imageViewModel: imageViewModel)
}
