//
//  ContentVIew.swift
//  Assignment3
//
//  Created by Anuar Adilbek on 04.03.2025.
//

import SwiftUI

struct ContentVIew: View {
    @ObservedObject var viewModel: SuperHeroViewModel
    var body: some View {
        ZStack {
            Color("darkRed")
                .ignoresSafeArea()
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width:200, height: 80)
                AsyncImage(url: viewModel.selectedHero?.imageUrl) { phase in
                    switch phase {
                    case .empty:
                        Color.black
                            .frame(width: 300, height: 250)
                            .cornerRadius(15)
                    case .success(let image):
                        image
                            .resizable()
                            .frame(width: 300, height: 250)
                            .cornerRadius(15)
                    case .failure(let error):
                        Color.red
                            .frame(width: 300, height: 250)
                            .cornerRadius(15)
                    }
                }
                .padding(12)
                
                if let hero = viewModel.selectedHero {
                    
                    Text("""
                                        Name: \(hero.name!)
                                        Full Name: \((hero.biography?.fullName!)!)
                                        Place of Birth: \((hero.biography?.placeOfBirth)!)
                                        Publisher: \((hero.biography?.publisher)!)
                                        
                                        Gender: \((hero.appearance?.gender)!)
                                        Race: \(hero.appearance?.race ?? "Unknown")
                                        Height: \(hero.appearance?.height?[1] ?? "Unknown")
                                        Weight: \(hero.appearance?.weight?[1] ?? "Unknown")
                                        Hair Color: \(hero.appearance?.hairColor ?? "Unknown")
                                        
                                        """)
                    .font(.body)
                    .padding()
                    .cornerRadius(12)
                    .foregroundColor(.white)
                } else {
                    Text("No hero selected")
                        .font(.title3)
                        .foregroundColor(.white)
                }
                
                Button {
                    Task {
                        await viewModel.fetchHero()
                    }
                } label: {
                    Text("Roll Hero")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        
    }
}

#Preview {
    let viewModel = SuperHeroViewModel()
    ContentVIew(viewModel: viewModel)
}
