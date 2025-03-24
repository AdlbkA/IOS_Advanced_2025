//
//  HeroDetailView.swift
//  Assignment4
//
//  Created by Anuar Adilbek on 24.03.2025.
//

import SwiftUI

struct HeroDetailView: View {
    @StateObject var viewModel: DetailViewModel
    var id: Int
    
    var body: some View {
        ZStack {
            Color("wineRed")
                .ignoresSafeArea()
            VStack{
                AsyncImage(url: viewModel.heroModel?.imageUrl){ phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 300, height: 300)
                            .padding(16)
                    case .success(let image):
                        image
                            .resizable()
                            .frame(width: 300, height: 300)
                            .padding(16)
                        
                    case .failure(let error):
                        Color.red
                            .frame(width: 300, height: 300)
                            .padding(16)
                    }
                }
                
                Spacer()
                
                Text(viewModel.heroModel?.title ?? "No name")
                    .font(.title2)
                Text(viewModel.heroModel?.description ?? "No description")
                    .font(.title2)
                Text(viewModel.heroModel?.publisher ?? "No Publisher")
                    .font(.title2)
                Text(viewModel.heroModel?.apperance ?? "No appereance")
                    .font(.title2)
                
                Spacer()
            }
            .task {
                await viewModel.loadHero(heroId: id)
            }
        }
        
    }
}

#Preview {
    let viewModel = DetailViewModel()
    HeroDetailView(viewModel: viewModel, id: 1)
}
